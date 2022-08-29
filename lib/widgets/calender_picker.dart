// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poc/constants/assets.dart';
import 'package:poc/styles/colors.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

const Duration _monthScrollDuration = Duration(milliseconds: 200);

const double _dayPickerRowHeight = 42.0;
int _maxDayPickerRowCount = 5; // A 31 day month that starts on Saturday.
// One extra row for the day-of-week header.
double _maxDayPickerHeight = _dayPickerRowHeight * (_maxDayPickerRowCount + 1);
const double _monthPickerHorizontalPadding = 0.0;

const int _yearPickerColumnCount = 3;
const double _yearPickerPadding = 16.0;
const double _yearPickerRowHeight = 52.0;
const double _yearPickerRowSpacing = 8.0;

const double _subHeaderHeight = 40.0;
const double _monthNavButtonsWidth = 66.0;

/// Displays a grid of days for a given month and allows the user to select a
/// date.
///
/// Days are arranged in a rectangular grid with one column for each day of the
/// week. Controls are provided to change the year and month that the grid is
/// showing.
///
/// The calendar picker widget is rarely used directly. Instead, consider using
/// [showDatePicker], which will create a dialog that uses this as well as
/// provides a text entry option.
///
/// See also:
///
///  * [showDatePicker], which creates a Dialog that contains a
///    [CalendarDatePicker] and provides an optional compact view where the
///    user can enter a date as a line of text.
///  * [showTimePicker], which shows a dialog that contains a material design
///    time picker.
///
class PrimaryCalendarDatePicker extends StatefulWidget {
  final VoidCallback? onDatePressed;

  /// Creates a calendar date picker.
  ///
  /// It will display a grid of days for the [initialDate]'s month. The day
  /// indicated by [initialDate] will be selected.
  ///
  /// The optional [onDisplayedMonthChanged] callback can be used to track
  /// the currently displayed month.
  ///
  /// The user interface provides a way to change the year of the month being
  /// displayed. By default it will show the day grid, but this can be changed
  /// to start in the year selection interface with [initialCalendarMode] set
  /// to [DatePickerMode.year].
  ///
  /// The [initialDate], [firstDate], [lastDate], [onDateChanged], and
  /// [initialCalendarMode] must be non-null.
  ///
  /// [lastDate] must be after or equal to [firstDate].
  ///
  /// [initialDate] must be between [firstDate] and [lastDate] or equal to
  /// one of them.
  ///
  /// [currentDate] represents the current day (i.e. today). This
  /// date will be highlighted in the day grid. If null, the date of
  /// `DateTime.now()` will be used.
  ///
  /// If [selectableDayPredicate] is non-null, it must return `true` for the
  /// [initialDate].
  PrimaryCalendarDatePicker({
    Key? key,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
    required this.onDateChanged,
    this.onDisplayedMonthChanged,
    this.initialCalendarMode = DatePickerMode.day,
    this.selectableDayPredicate,
    required this.label,
    required this.isVisible,
    required this.onPressed,
    this.onDatePressed,
    this.title,
  })  : initialDate = DateUtils.dateOnly(initialDate),
        firstDate = DateUtils.dateOnly(firstDate),
        lastDate = DateUtils.dateOnly(lastDate),
        currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now()),
        super(key: key) {
    assert(
      !this.lastDate.isBefore(this.firstDate),
      'lastDate ${this.lastDate} must be on or after firstDate ${this.firstDate}.',
    );
    assert(
      !this.initialDate.isBefore(this.firstDate),
      'initialDate ${this.initialDate} must be on or after firstDate ${this.firstDate}.',
    );
    assert(
      !this.initialDate.isAfter(this.lastDate),
      'initialDate ${this.initialDate} must be on or before lastDate ${this.lastDate}.',
    );
    assert(
      selectableDayPredicate == null || selectableDayPredicate!(this.initialDate),
      'Provided initialDate ${this.initialDate} must satisfy provided selectableDayPredicate.',
    );
  }

  final VoidCallback onPressed;

  final String? title;

  /// The initially selected [DateTime] that the picker should display.
  final DateTime initialDate;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// Called when the user selects a date in the picker.
  final ValueChanged<DateTime> onDateChanged;

  /// Called when the user navigates to a new month/year in the picker.
  final ValueChanged<DateTime>? onDisplayedMonthChanged;

  /// The initial display of the calendar picker.
  final DatePickerMode initialCalendarMode;

  /// Function to provide full control over which dates in the calendar can be selected.
  final SelectableDayPredicate? selectableDayPredicate;

  /// Set the label for the widget
  final String label;

  final bool isVisible;

  @override
  State<PrimaryCalendarDatePicker> createState() => _PrimaryCalendarDatePickerState();
}

class _PrimaryCalendarDatePickerState extends State<PrimaryCalendarDatePicker> {
  bool _announcedInitialDate = false;
  late DatePickerMode _mode;
  late DateTime _currentDisplayedMonthDate;
  late DateTime _selectedDate;
  final GlobalKey _monthPickerKey = GlobalKey();
  final GlobalKey _yearPickerKey = GlobalKey();
  late MaterialLocalizations _localizations;
  late TextDirection _textDirection;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialCalendarMode;
    _currentDisplayedMonthDate = DateTime(widget.initialDate.year, widget.initialDate.month);
    _selectedDate = widget.initialDate;
  }

  @override
  void didUpdateWidget(PrimaryCalendarDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCalendarMode != oldWidget.initialCalendarMode) {
      _mode = widget.initialCalendarMode;
    }
    if (!DateUtils.isSameDay(widget.initialDate, oldWidget.initialDate)) {
      _currentDisplayedMonthDate = DateTime(widget.initialDate.year, widget.initialDate.month);
      _selectedDate = widget.initialDate;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(debugCheckHasDirectionality(context));
    _localizations = MaterialLocalizations.of(context);
    _textDirection = Directionality.of(context);
    if (!_announcedInitialDate) {
      _announcedInitialDate = true;
      SemanticsService.announce(
        _localizations.formatFullDate(_selectedDate),
        _textDirection,
      );
    }
  }

  void _vibrate() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        HapticFeedback.vibrate();
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        break;
    }
  }

  void _handleModeChanged(DatePickerMode mode) {
    _vibrate();
    setState(() {
      _mode = mode;
      if (_mode == DatePickerMode.day) {
        SemanticsService.announce(
          _localizations.formatMonthYear(_selectedDate),
          _textDirection,
        );
      } else {
        SemanticsService.announce(
          _localizations.formatYear(_selectedDate),
          _textDirection,
        );
      }
    });
  }

  void _handleMonthChanged(DateTime date) {
    setState(() {
      if (_currentDisplayedMonthDate.year != date.year || _currentDisplayedMonthDate.month != date.month) {
        _currentDisplayedMonthDate = DateTime(date.year, date.month);
        widget.onDisplayedMonthChanged?.call(_currentDisplayedMonthDate);
      }
    });
  }

  void _handleYearChanged(DateTime value) {
    _vibrate();

    if (value.isBefore(widget.firstDate)) {
      value = widget.firstDate;
    } else if (value.isAfter(widget.lastDate)) {
      value = widget.lastDate;
    }

    setState(() {
      _mode = DatePickerMode.day;
      _handleMonthChanged(value);
    });
  }

  void _handleDayChanged(DateTime value) {
    _vibrate();
    setState(() {
      _selectedDate = value;
      widget.onDateChanged(_selectedDate);
    });
  }

  Widget _buildPicker() {
    switch (_mode) {
      case DatePickerMode.day:
        return _MonthPicker(
          key: _monthPickerKey,
          label: widget.label,
          onMonthPressed: widget.onPressed,
          title: widget.title,
          isVisible: widget.isVisible,
          initialMonth: _currentDisplayedMonthDate,
          currentDate: widget.currentDate,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          selectedDate: _selectedDate,
          onDateTapped: widget.onDatePressed,
          onChanged: _handleDayChanged,
          onDisplayedMonthChanged: _handleMonthChanged,
          selectableDayPredicate: widget.selectableDayPredicate,
        );
      case DatePickerMode.year:
        return Padding(
          padding: const EdgeInsets.only(top: _subHeaderHeight),
          child: YearPicker(
            key: _yearPickerKey,
            currentDate: widget.currentDate,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            initialDate: _currentDisplayedMonthDate,
            selectedDate: _selectedDate,
            onChanged: _handleYearChanged,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(debugCheckHasDirectionality(context));
    return Stack(
      children: <Widget>[
        SizedBox(
          height: _subHeaderHeight + (widget.isVisible ? _maxDayPickerHeight : 0),
          child: _buildPicker(),
        ),
        // Put the mode toggle button on top so that it won't be covered up by the _MonthPicker
        // _DatePickerModeToggleButton(
        //   mode: _mode,
        //   label: widget.label,
        //   title: widget.title ?? _localizations.formatMonthYear(_currentDisplayedMonthDate),
        //   onTitlePressed: () {
        //     _handleModeChanged(_mode == DatePickerMode.day ? DatePickerMode.year : DatePickerMode.day);
        //   },
        //   onDatePressed: widget.onMonthPressed,
        // ),
      ],
    );
  }
}

/// A button that used to toggle the [DatePickerMode] for a date picker.
///
/// This appears above the calendar grid and allows the user to toggle the
/// [DatePickerMode] to display either the calendar view or the year list.
class _DatePickerModeToggleButton extends StatefulWidget {
  const _DatePickerModeToggleButton({
    required this.mode,
    required this.title,
    required this.onTitlePressed,
    required this.label,
    required this.onDatePressed,
  });

  final VoidCallback onDatePressed;

  /// The current display of the calendar picker.
  final DatePickerMode mode;

  /// The text that displays the current month/year being viewed.
  final String title;

  /// Set the label for the widget
  final String label;

  /// The callback when the title is pressed.
  final VoidCallback onTitlePressed;

  @override
  _DatePickerModeToggleButtonState createState() => _DatePickerModeToggleButtonState();
}

class _DatePickerModeToggleButtonState extends State<_DatePickerModeToggleButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.mode == DatePickerMode.year ? 0.5 : 0,
      upperBound: 0.5,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(_DatePickerModeToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mode == widget.mode) {
      return;
    }

    if (widget.mode == DatePickerMode.year) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsetsDirectional.only(start: 16, end: 4),
      height: _subHeaderHeight,
      // height: _subHeaderHeight + (widget.isVisible ? _maxDayPickerHeight : 0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Semantics(
              label: MaterialLocalizations.of(context).selectYearSemanticsLabel,
              excludeSemantics: true,
              button: true,
              child: SizedBox(
                height: _subHeaderHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextView(
                        widget.label,
                        height: 1.2,
                        textType: TextType.subtitle,
                        color: Palette.hintColor,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: widget.onDatePressed,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      minSize: 0,
                      child: TextView(
                        widget.title,
                        height: 1.2,
                        textType: TextType.subtitle,
                        color: Palette.textColor,
                      ),
                    ),

                    // RotationTransition(
                    //   turns: _controller,
                    //   child: Icon(
                    //     Icons.arrow_drop_down,
                    //     color: controlColor,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          // if (widget.mode == DatePickerMode.day)
          //   // Give space for the prev/next month buttons that are underneath this row
          //   const SizedBox(width: _monthNavButtonsWidth),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _MonthPicker extends StatefulWidget {
  final String? title, label;

  final VoidCallback? onMonthPressed;

  /// Creates a month picker.
  _MonthPicker({
    Key? key,
    required this.initialMonth,
    required this.currentDate,
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
    required this.onChanged,
    required this.onDisplayedMonthChanged,
    this.selectableDayPredicate,
    required this.isVisible,
    this.onDateTapped,
    this.title,
    this.label,
    this.onMonthPressed,
  })  : assert(!firstDate.isAfter(lastDate)),
        assert(!selectedDate.isBefore(firstDate)),
        assert(!selectedDate.isAfter(lastDate)),
        super(key: key);

  final VoidCallback? onDateTapped;

  /// The initial month to display.
  final DateTime initialMonth;

  /// The current date.
  ///
  /// This date is subtly highlighted in the picker.
  final DateTime currentDate;

  /// The earliest date the user is permitted to pick.
  ///
  /// This date must be on or before the [lastDate].
  final DateTime firstDate;

  /// The latest date the user is permitted to pick.
  ///
  /// This date must be on or after the [firstDate].
  final DateTime lastDate;

  /// The currently selected date.
  ///
  /// This date is highlighted in the picker.
  final DateTime selectedDate;

  /// Called when the user picks a day.
  final ValueChanged<DateTime> onChanged;

  /// Called when the user navigates to a new month.
  final ValueChanged<DateTime> onDisplayedMonthChanged;

  /// Optional user supplied predicate function to customize selectable days.
  final SelectableDayPredicate? selectableDayPredicate;

  final bool isVisible;

  @override
  _MonthPickerState createState() => _MonthPickerState();
}

class _MonthPickerState extends State<_MonthPicker> {
  final GlobalKey _pageViewKey = GlobalKey();
  late DateTime _currentMonth;
  late PageController _pageController;
  late MaterialLocalizations _localizations;
  late TextDirection _textDirection;
  Map<ShortcutActivator, Intent>? _shortcutMap;
  Map<Type, Action<Intent>>? _actionMap;
  late FocusNode _dayGridFocus;
  DateTime? _focusedDay;

  @override
  void initState() {
    super.initState();
    _currentMonth = widget.initialMonth;
    _pageController = PageController(initialPage: DateUtils.monthDelta(widget.firstDate, _currentMonth));
    _shortcutMap = const <ShortcutActivator, Intent>{
      SingleActivator(LogicalKeyboardKey.arrowLeft): DirectionalFocusIntent(TraversalDirection.left),
      SingleActivator(LogicalKeyboardKey.arrowRight): DirectionalFocusIntent(TraversalDirection.right),
      SingleActivator(LogicalKeyboardKey.arrowDown): DirectionalFocusIntent(TraversalDirection.down),
      SingleActivator(LogicalKeyboardKey.arrowUp): DirectionalFocusIntent(TraversalDirection.up),
    };
    _actionMap = <Type, Action<Intent>>{
      NextFocusIntent: CallbackAction<NextFocusIntent>(onInvoke: _handleGridNextFocus),
      PreviousFocusIntent: CallbackAction<PreviousFocusIntent>(onInvoke: _handleGridPreviousFocus),
      DirectionalFocusIntent: CallbackAction<DirectionalFocusIntent>(onInvoke: _handleDirectionFocus),
    };
    _dayGridFocus = FocusNode(debugLabel: 'Day Grid');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = MaterialLocalizations.of(context);
    _textDirection = Directionality.of(context);
  }

  @override
  void didUpdateWidget(_MonthPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialMonth != oldWidget.initialMonth && widget.initialMonth != _currentMonth) {
      // We can't interrupt this widget build with a scroll, so do it next frame
      WidgetsBinding.instance.addPostFrameCallback(
        (Duration timeStamp) => _showMonth(widget.initialMonth, jump: true),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _dayGridFocus.dispose();
    super.dispose();
  }

  void _handleDateSelected(DateTime selectedDate) {
    _focusedDay = selectedDate;
    widget.onChanged(selectedDate);
  }

  void _handleMonthPageChanged(int monthPage) {
    setState(() {
      final DateTime monthDate = DateUtils.addMonthsToMonthDate(widget.firstDate, monthPage);
      if (!DateUtils.isSameMonth(_currentMonth, monthDate)) {
        _currentMonth = DateTime(monthDate.year, monthDate.month);
        widget.onDisplayedMonthChanged(_currentMonth);
        if (_focusedDay != null && !DateUtils.isSameMonth(_focusedDay, _currentMonth)) {
          // We have navigated to a new month with the grid focused, but the
          // focused day is not in this month. Choose a new one trying to keep
          // the same day of the month.
          _focusedDay = _focusableDayForMonth(_currentMonth, _focusedDay!.day);
        }
        SemanticsService.announce(
          _localizations.formatMonthYear(_currentMonth),
          _textDirection,
        );
      }
    });
  }

  /// Returns a focusable date for the given month.
  ///
  /// If the preferredDay is available in the month it will be returned,
  /// otherwise the first selectable day in the month will be returned. If
  /// no dates are selectable in the month, then it will return null.
  DateTime? _focusableDayForMonth(DateTime month, int preferredDay) {
    final int daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    // Can we use the preferred day in this month?
    if (preferredDay <= daysInMonth) {
      final DateTime newFocus = DateTime(month.year, month.month, preferredDay);
      if (_isSelectable(newFocus)) return newFocus;
    }

    // Start at the 1st and take the first selectable date.
    for (int day = 1; day <= daysInMonth; day++) {
      final DateTime newFocus = DateTime(month.year, month.month, day);
      if (_isSelectable(newFocus)) return newFocus;
    }
    return null;
  }

  /// Navigate to the next month.
  void _handleNextMonth() {
    if (!_isDisplayingLastMonth) {
      _pageController.nextPage(
        duration: _monthScrollDuration,
        curve: Curves.ease,
      );
    }
  }

  /// Navigate to the previous month.
  void _handlePreviousMonth() {
    if (!_isDisplayingFirstMonth) {
      _pageController.previousPage(
        duration: _monthScrollDuration,
        curve: Curves.ease,
      );
    }
  }

  /// Navigate to the given month.
  void _showMonth(DateTime month, {bool jump = false}) {
    final int monthPage = DateUtils.monthDelta(widget.firstDate, month);
    if (jump) {
      _pageController.jumpToPage(monthPage);
    } else {
      _pageController.animateToPage(
        monthPage,
        duration: _monthScrollDuration,
        curve: Curves.ease,
      );
    }
  }

  /// True if the earliest allowable month is displayed.
  bool get _isDisplayingFirstMonth {
    return !_currentMonth.isAfter(
      DateTime(widget.firstDate.year, widget.firstDate.month),
    );
  }

  /// True if the latest allowable month is displayed.
  bool get _isDisplayingLastMonth {
    return !_currentMonth.isBefore(
      DateTime(widget.lastDate.year, widget.lastDate.month),
    );
  }

  /// Handler for when the overall day grid obtains or loses focus.
  void _handleGridFocusChange(bool focused) {
    setState(() {
      if (focused && _focusedDay == null) {
        if (DateUtils.isSameMonth(widget.selectedDate, _currentMonth)) {
          _focusedDay = widget.selectedDate;
        } else if (DateUtils.isSameMonth(widget.currentDate, _currentMonth)) {
          _focusedDay = _focusableDayForMonth(_currentMonth, widget.currentDate.day);
        } else {
          _focusedDay = _focusableDayForMonth(_currentMonth, 1);
        }
      }
    });
  }

  /// Move focus to the next element after the day grid.
  void _handleGridNextFocus(NextFocusIntent intent) {
    _dayGridFocus.requestFocus();
    _dayGridFocus.nextFocus();
  }

  /// Move focus to the previous element before the day grid.
  void _handleGridPreviousFocus(PreviousFocusIntent intent) {
    _dayGridFocus.requestFocus();
    _dayGridFocus.previousFocus();
  }

  /// Move the internal focus date in the direction of the given intent.
  ///
  /// This will attempt to move the focused day to the next selectable day in
  /// the given direction. If the new date is not in the current month, then
  /// the page view will be scrolled to show the new date's month.
  ///
  /// For horizontal directions, it will move forward or backward a day (depending
  /// on the current [TextDirection]). For vertical directions it will move up and
  /// down a week at a time.
  void _handleDirectionFocus(DirectionalFocusIntent intent) {
    assert(_focusedDay != null);
    setState(() {
      final DateTime? nextDate = _nextDateInDirection(_focusedDay!, intent.direction);
      if (nextDate != null) {
        _focusedDay = nextDate;
        if (!DateUtils.isSameMonth(_focusedDay, _currentMonth)) {
          _showMonth(_focusedDay!);
        }
      }
    });
  }

  static const Map<TraversalDirection, int> _directionOffset = <TraversalDirection, int>{
    TraversalDirection.up: -DateTime.daysPerWeek,
    TraversalDirection.right: 1,
    TraversalDirection.down: DateTime.daysPerWeek,
    TraversalDirection.left: -1,
  };

  int _dayDirectionOffset(TraversalDirection traversalDirection, TextDirection textDirection) {
    // Swap left and right if the text direction if RTL
    if (textDirection == TextDirection.rtl) {
      if (traversalDirection == TraversalDirection.left) {
        traversalDirection = TraversalDirection.right;
      } else if (traversalDirection == TraversalDirection.right) {
        traversalDirection = TraversalDirection.left;
      }
    }
    return _directionOffset[traversalDirection]!;
  }

  DateTime? _nextDateInDirection(DateTime date, TraversalDirection direction) {
    final TextDirection textDirection = Directionality.of(context);
    DateTime nextDate = DateUtils.addDaysToDate(date, _dayDirectionOffset(direction, textDirection));
    while (!nextDate.isBefore(widget.firstDate) && !nextDate.isAfter(widget.lastDate)) {
      if (_isSelectable(nextDate)) {
        return nextDate;
      }
      nextDate = DateUtils.addDaysToDate(nextDate, _dayDirectionOffset(direction, textDirection));
    }
    return null;
  }

  bool _isSelectable(DateTime date) {
    return widget.selectableDayPredicate == null || widget.selectableDayPredicate!.call(date);
  }

  Widget _buildItems(BuildContext context, int index) {
    final DateTime month = DateUtils.addMonthsToMonthDate(widget.firstDate, index);
    return _DayPicker(
      key: ValueKey<DateTime>(month),
      selectedDate: widget.selectedDate,
      currentDate: widget.currentDate,
      onChanged: _handleDateSelected,
      firstDate: widget.firstDate,
      lastDate: widget.lastDate,
      onDateTapped: widget.onDateTapped,
      displayedMonth: month,
      selectableDayPredicate: widget.selectableDayPredicate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color controlColor = Theme.of(context).colorScheme.primary;

    return Semantics(
      child: Column(
        children: <Widget>[
          // Header
          SizedBox(
            height: _subHeaderHeight,
            child: Row(
              children: [
                Expanded(
                  child: TextView(
                    widget.label,
                    height: 1.2,
                    textType: TextType.subtitle,
                    color: Palette.hintColor,
                  ),
                ),
                CupertinoButton(
                  onPressed: widget.onMonthPressed,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  minSize: 0,
                  child: TextView(
                    widget.title ?? _localizations.formatMonthYear(widget.initialMonth),
                    height: 1.2,
                    textType: TextType.subtitle,
                    color: Palette.textColor,
                  ),
                ),
                10.0.width,
                if (widget.title != null && !widget.isVisible)
                  PrimaryIconButton(
                    svg: Assets.assetsIconsEditPencil,
                    padding: const EdgeInsets.all(4),
                    size: 22,
                    color: controlColor,
                    onPressed: widget.onMonthPressed,
                  ),
                if (widget.title == null || widget.isVisible)
                  PrimaryIconButton(
                    svg: Assets.assetsIconsChevLeft,
                    padding: const EdgeInsets.all(4),
                    size: 22,
                    color: controlColor,
                    onPressed: _isDisplayingFirstMonth || !widget.isVisible ? null : _handlePreviousMonth,
                  ),
                if (widget.title == null || widget.isVisible)
                  PrimaryIconButton(
                    padding: const EdgeInsets.all(4),
                    svg: Assets.assetsIconsChevRight,
                    size: 22,
                    color: controlColor,
                    onPressed: _isDisplayingLastMonth || !widget.isVisible ? null : _handleNextMonth,
                  ),
              ],
            ),
          ),
          // Calender
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: !widget.isVisible
                  ? null
                  : FocusableActionDetector(
                      shortcuts: _shortcutMap,
                      actions: _actionMap,
                      focusNode: _dayGridFocus,
                      onFocusChange: _handleGridFocusChange,
                      child: _FocusedDate(
                        date: _dayGridFocus.hasFocus ? _focusedDay : null,
                        child: PageView.builder(
                          key: _pageViewKey,
                          controller: _pageController,
                          itemBuilder: _buildItems,
                          itemCount: DateUtils.monthDelta(widget.firstDate, widget.lastDate) + 1,
                          onPageChanged: _handleMonthPageChanged,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

/// InheritedWidget indicating what the current focused date is for its children.
///
/// This is used by the [_MonthPicker] to let its children [_DayPicker]s know
/// what the currently focused date (if any) should be.
class _FocusedDate extends InheritedWidget {
  const _FocusedDate({
    Key? key,
    required Widget child,
    this.date,
  }) : super(key: key, child: child);

  final DateTime? date;

  @override
  bool updateShouldNotify(_FocusedDate oldWidget) {
    return !DateUtils.isSameDay(date, oldWidget.date);
  }

  static DateTime? of(BuildContext context) {
    final _FocusedDate? focusedDate = context.dependOnInheritedWidgetOfExactType<_FocusedDate>();
    return focusedDate?.date;
  }
}

/// Displays the days of a given month and allows choosing a day.
///
/// The days are arranged in a rectangular grid with one column for each day of
/// the week.
class _DayPicker extends StatefulWidget {
  /// Creates a day picker.
  _DayPicker({
    Key? key,
    required this.currentDate,
    required this.displayedMonth,
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
    required this.onChanged,
    this.selectableDayPredicate,
    this.onDateTapped,
  })  : assert(!firstDate.isAfter(lastDate)),
        assert(!selectedDate.isBefore(firstDate)),
        assert(!selectedDate.isAfter(lastDate)),
        super(key: key);

  final VoidCallback? onDateTapped;

  /// The currently selected date.
  ///
  /// This date is highlighted in the picker.
  final DateTime selectedDate;

  /// The current date at the time the picker is displayed.
  final DateTime currentDate;

  /// Called when the user picks a day.
  final ValueChanged<DateTime> onChanged;

  /// The earliest date the user is permitted to pick.
  ///
  /// This date must be on or before the [lastDate].
  final DateTime firstDate;

  /// The latest date the user is permitted to pick.
  ///
  /// This date must be on or after the [firstDate].
  final DateTime lastDate;

  /// The month whose days are displayed by this picker.
  final DateTime displayedMonth;

  /// Optional user supplied predicate function to customize selectable days.
  final SelectableDayPredicate? selectableDayPredicate;

  @override
  _DayPickerState createState() => _DayPickerState();
}

class _DayPickerState extends State<_DayPicker> {
  /// List of [FocusNode]s, one for each day of the month.
  late List<FocusNode> _dayFocusNodes;

  @override
  void initState() {
    super.initState();
    final int daysInMonth = DateUtils.getDaysInMonth(widget.displayedMonth.year, widget.displayedMonth.month);
    _dayFocusNodes = List<FocusNode>.generate(
      daysInMonth,
      (int index) => FocusNode(skipTraversal: true, debugLabel: 'Day ${index + 1}'),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check to see if the focused date is in this month, if so focus it.
    final DateTime? focusedDate = _FocusedDate.of(context);
    if (focusedDate != null && DateUtils.isSameMonth(widget.displayedMonth, focusedDate)) {
      _dayFocusNodes[focusedDate.day - 1].requestFocus();
    }
  }

  @override
  void dispose() {
    for (final FocusNode node in _dayFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  /// Builds widgets showing abbreviated days of week. The first widget in the
  /// returned list corresponds to the first day of week for the current locale.
  ///
  /// Examples:
  ///
  /// ```
  /// ┌ Sunday is the first day of week in the US (en_US)
  /// |
  /// S M T W T F S  <-- the returned list contains these widgets
  /// _ _ _ _ _ 1 2
  /// 3 4 5 6 7 8 9
  ///
  /// ┌ But it's Monday in the UK (en_GB)
  /// |
  /// M T W T F S S  <-- the returned list contains these widgets
  /// _ _ _ _ 1 2 3
  /// 4 5 6 7 8 9 10
  /// ```
  List<Widget> _dayHeaders(TextStyle? headerStyle, MaterialLocalizations localizations) {
    final List<Widget> result = <Widget>[];
    // localizations.narrowWeekdays
    for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
      final String weekday = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][i];
      result.add(ExcludeSemantics(
        child: Center(
          child: Text(
            weekday,
            style: headerStyle?.copyWith(
              color: Palette.lightTextColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ));
      if (i == (localizations.firstDayOfWeekIndex - 1) % 7) break;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    // final TextTheme textTheme = Theme.of(context).textTheme;
    // final TextStyle? headerStyle = textTheme.caption?.apply(
    //   color: colorScheme.onSurface.withOpacity(0.60),
    // );
    final TextStyle dayStyle = TextType.calendar;
    const Color enabledDayColor = Palette.textColor;
    const Color disabledDayColor = Palette.lightIconColor;
    final Color selectedDayColor = colorScheme.onPrimary;
    final Color selectedDayBackground = colorScheme.primary;
    final Color todayColor = colorScheme.primary;

    final int year = widget.displayedMonth.year;
    final int month = widget.displayedMonth.month;

    final int daysInMonth = DateUtils.getDaysInMonth(year, month);
    final int dayOffset = DateUtils.firstDayOffset(year, month, localizations);

    final List<Widget> dayItems = _dayHeaders(TextType.calendar, localizations);
    // 1-based day of month, e.g. 1-31 for January, and 1-29 for February on
    // a leap year.
    int day = -dayOffset;

    if (dayOffset > 5) {
      _maxDayPickerRowCount = 5;
    } else {
      _maxDayPickerRowCount = 4;
    }

    while (day < daysInMonth) {
      day++;
      if (day < 1) {
        dayItems.add(Container());
      } else {
        final DateTime dayToBuild = DateTime(year, month, day);
        final bool isDisabled = dayToBuild.isAfter(widget.lastDate) ||
            dayToBuild.isBefore(widget.firstDate) ||
            (widget.selectableDayPredicate != null && !widget.selectableDayPredicate!(dayToBuild));
        final bool isSelectedDay = DateUtils.isSameDay(widget.selectedDate, dayToBuild);
        final bool isToday = DateUtils.isSameDay(widget.currentDate, dayToBuild);

        BoxDecoration? decoration;
        Color dayColor = enabledDayColor;
        if (isSelectedDay) {
          // The selected day gets a circle background highlight, and a
          // contrasting text color.
          dayColor = selectedDayColor;
          decoration = BoxDecoration(
            color: selectedDayBackground,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          );
        } else if (isDisabled) {
          dayColor = disabledDayColor;
        }

        // } else if (isToday) {
        //   // The current day gets a different text color and a circle stroke
        //   // border.
        //   dayColor = todayColor;
        //   decoration = BoxDecoration(
        //     border: Border.all(color: todayColor),
        //     borderRadius: BorderRadius.circular(10),
        //     shape: BoxShape.rectangle,
        //   );
        // }

        Widget dayWidget = Center(
          child: Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: decoration,
            padding: EdgeInsets.zero,
            child: Text(
              localizations.formatDecimal(day),
              style: dayStyle.apply(color: dayColor),
            ),
          ),
        );

        if (isDisabled) {
          dayWidget = ExcludeSemantics(
            child: dayWidget,
          );
        } else {
          dayWidget = InkResponse(
            focusNode: _dayFocusNodes[day - 1],
            onTap: () {
              widget.onChanged(dayToBuild);
              widget.onDateTapped?.call();
            },
            radius: _dayPickerRowHeight / 2 + 4,
            splashColor: selectedDayBackground.withOpacity(0.38),
            child: Semantics(
              label: '${localizations.formatDecimal(day)}, ${localizations.formatFullDate(dayToBuild)}',
              selected: isSelectedDay,
              excludeSemantics: true,
              child: dayWidget,
            ),
          );
        }

        dayItems.add(dayWidget);
      }
    }

    return GridView.custom(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: _dayPickerGridDelegate,
      childrenDelegate: SliverChildListDelegate(
        dayItems,
        addRepaintBoundaries: false,
      ),
    );
  }
}

class _DayPickerGridDelegate extends SliverGridDelegate {
  const _DayPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    const int columnCount = DateTime.daysPerWeek;

    debugPrint('constraints: ${constraints.crossAxisExtent}');
    // final double tileWidth = constraints.crossAxisExtent / columnCount;
    // final double tileHeight = math.min(
    //   _dayPickerRowHeight,
    //   constraints.viewportMainAxisExtent / (_maxDayPickerRowCount + 2),
    // );

    // final double tileWidth = constraints.crossAxisExtent / columnCount;
    // final double tileHeight = math.min(
    //   _dayPickerRowHeight,
    //   constraints.viewportMainAxisExtent / (_maxDayPickerRowCount + 1),
    // );

    return SliverGridRegularTileLayout(
      childCrossAxisExtent: constraints.crossAxisExtent / 7,
      childMainAxisExtent: 35,
      crossAxisCount: columnCount,
      crossAxisStride: (constraints.crossAxisExtent) / 7,
      mainAxisStride: constraints.viewportMainAxisExtent / (_maxDayPickerRowCount + 2),
      reverseCrossAxis: false,
    );
  }

  @override
  bool shouldRelayout(_DayPickerGridDelegate oldDelegate) => false;
}

const _DayPickerGridDelegate _dayPickerGridDelegate = _DayPickerGridDelegate();

/// A scrollable grid of years to allow picking a year.
///
/// The year picker widget is rarely used directly. Instead, consider using
/// [PrimaryCalendarDatePicker], or [showDatePicker] which create full date pickers.
///
/// See also:
///
///  * [PrimaryCalendarDatePicker], which provides a Material Design date picker
///    interface.
///
///  * [showDatePicker], which shows a dialog containing a Material Design
///    date picker.
///
class YearPicker extends StatefulWidget {
  /// Creates a year picker.
  ///
  /// The [firstDate], [lastDate], [selectedDate], and [onChanged]
  /// arguments must be non-null. The [lastDate] must be after the [firstDate].
  YearPicker({
    Key? key,
    DateTime? currentDate,
    required this.firstDate,
    required this.lastDate,
    DateTime? initialDate,
    required this.selectedDate,
    required this.onChanged,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(!firstDate.isAfter(lastDate)),
        currentDate = DateUtils.dateOnly(currentDate ?? DateTime.now()),
        initialDate = DateUtils.dateOnly(initialDate ?? selectedDate),
        super(key: key);

  /// The current date.
  ///
  /// This date is subtly highlighted in the picker.
  final DateTime currentDate;

  /// The earliest date the user is permitted to pick.
  final DateTime firstDate;

  /// The latest date the user is permitted to pick.
  final DateTime lastDate;

  /// The initial date to center the year display around.
  final DateTime initialDate;

  /// The currently selected date.
  ///
  /// This date is highlighted in the picker.
  final DateTime selectedDate;

  /// Called when the user picks a year.
  final ValueChanged<DateTime> onChanged;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  @override
  State<YearPicker> createState() => _YearPickerState();
}

class _YearPickerState extends State<YearPicker> {
  late ScrollController _scrollController;

  // The approximate number of years necessary to fill the available space.
  static const int minYears = 18;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: _scrollOffsetForYear(widget.selectedDate));
  }

  @override
  void didUpdateWidget(YearPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      _scrollController.jumpTo(_scrollOffsetForYear(widget.selectedDate));
    }
  }

  double _scrollOffsetForYear(DateTime date) {
    final int initialYearIndex = date.year - widget.firstDate.year;
    final int initialYearRow = initialYearIndex ~/ _yearPickerColumnCount;
    // Move the offset down by 2 rows to approximately center it.
    final int centeredYearRow = initialYearRow - 2;
    return _itemCount < minYears ? 0 : centeredYearRow * _yearPickerRowHeight;
  }

  Widget _buildYearItem(BuildContext context, int index) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    // Backfill the _YearPicker with disabled years if necessary.
    final int offset = _itemCount < minYears ? (minYears - _itemCount) ~/ 2 : 0;
    final int year = widget.firstDate.year + index - offset;
    final bool isSelected = year == widget.selectedDate.year;
    final bool isCurrentYear = year == widget.currentDate.year;
    final bool isDisabled = year < widget.firstDate.year || year > widget.lastDate.year;
    const double decorationHeight = 36.0;
    const double decorationWidth = 72.0;

    final Color textColor;
    if (isSelected) {
      textColor = colorScheme.onPrimary;
    } else if (isDisabled) {
      textColor = colorScheme.onSurface.withOpacity(0.38);
    } else if (isCurrentYear) {
      textColor = colorScheme.primary;
    } else {
      textColor = colorScheme.onSurface.withOpacity(0.87);
    }
    final TextStyle? itemStyle = textTheme.bodyText1?.apply(color: textColor);

    BoxDecoration? decoration;
    if (isSelected) {
      decoration = BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(decorationHeight / 2),
      );
    } else if (isCurrentYear && !isDisabled) {
      decoration = BoxDecoration(
        border: Border.all(
          color: colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(decorationHeight / 2),
      );
    }

    Widget yearItem = Center(
      child: Container(
        decoration: decoration,
        height: decorationHeight,
        width: decorationWidth,
        child: Center(
          child: Semantics(
            selected: isSelected,
            button: true,
            child: Text(year.toString(), style: itemStyle),
          ),
        ),
      ),
    );

    if (isDisabled) {
      yearItem = ExcludeSemantics(
        child: yearItem,
      );
    } else {
      yearItem = InkWell(
        key: ValueKey<int>(year),
        onTap: () => widget.onChanged(DateTime(year, widget.initialDate.month)),
        child: yearItem,
      );
    }

    return yearItem;
  }

  int get _itemCount {
    return widget.lastDate.year - widget.firstDate.year + 1;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    return Column(
      children: <Widget>[
        const Divider(),
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            dragStartBehavior: widget.dragStartBehavior,
            gridDelegate: _yearPickerGridDelegate,
            itemBuilder: _buildYearItem,
            itemCount: math.max(_itemCount, minYears),
            padding: const EdgeInsets.symmetric(horizontal: _yearPickerPadding),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class _YearPickerGridDelegate extends SliverGridDelegate {
  const _YearPickerGridDelegate();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double tileWidth = (constraints.crossAxisExtent - (_yearPickerColumnCount - 1) * _yearPickerRowSpacing) / _yearPickerColumnCount;
    return SliverGridRegularTileLayout(
      childCrossAxisExtent: tileWidth,
      childMainAxisExtent: _yearPickerRowHeight,
      crossAxisCount: _yearPickerColumnCount,
      crossAxisStride: tileWidth + _yearPickerRowSpacing,
      mainAxisStride: _yearPickerRowHeight,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_YearPickerGridDelegate oldDelegate) => false;
}

const _YearPickerGridDelegate _yearPickerGridDelegate = _YearPickerGridDelegate();
