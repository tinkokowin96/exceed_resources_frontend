import 'package:freezed_annotation/freezed_annotation.dart';

enum ETextType { body, error, primary, white, subtitle, disabled, disabledPrimary, category }

enum EText { h1, h2, h3, h4, h5 }

enum EMenu { home, task, chat, salary, misc }

enum EDevice { mobile, tablet, desktop }

enum ERequestMethod { get, post, patch, delete }

enum ESize { xs, sm, md, lg, xl }

enum EAsyncDropdown { tyep1 }

enum EExpandable { minimize, expand, form }

enum EInputStyle { line, primary }

enum EInputColor { primary, transparent, background }

enum EStructure { ceo, topManagement, department, executive }

enum EHistory { leave, late, overtime, salary, task, report }

enum EAttachment {
  @JsonValue('Video')
  video,
  @JsonValue('Image')
  image,
  @JsonValue('Pdf')
  pdf,
  @JsonValue('Thumbnail')
  thumbnail,
  @JsonValue('Url')
  url,
  @JsonValue('Others')
  others
}

enum EDynamicField {
  @JsonValue('Image')
  image,
  @JsonValue('Carousel')
  carousel,
  @JsonValue('Title')
  title,
  @JsonValue('Body')
  body,
  @JsonValue('Unordered')
  unordered
}

enum EChat {
  @JsonValue('Projects')
  projects,
  @JsonValue('Departments')
  departments,
  @JsonValue('Groups')
  groups,
  @JsonValue('Colleagues')
  colleagues
}

enum EField {
  @JsonValue('Colleague')
  colleague,
  @JsonValue('Department')
  department,
  @JsonValue('Position')
  position,
  @JsonValue('Report')
  report,
  @JsonValue('Date')
  date,
  @JsonValue('String')
  string,
  @JsonValue('number')
  number,
}

enum EColleagueDetailPermission {
  @JsonValue('Colleague')
  colleague,
  @JsonValue('Date')
  date,
  @JsonValue('String')
  string,
  @JsonValue('number')
  number,
}

enum EPermission {
  @JsonValue('AdminHomeView')
  adminHomeView,
  @JsonValue('ColleagueHomeView')
  colleagueHomeView,
  @JsonValue('ChangeStatus')
  changeStatus,
  @JsonValue('CreateStatus')
  createStatus,
  @JsonValue('CreateTask')
  createTask,
  @JsonValue('PayPointPerTask')
  payPointPerTask,
  @JsonValue('CreateProject')
  createProject,
  @JsonValue('PayPointPerProject')
  payPointPerProject,
  @JsonValue('CreateProjectPhase')
  createProjectPhase,
  @JsonValue('CreateProjectQuotation')
  createProjectQuotation,
  @JsonValue('CreateChatGroup')
  createChatGroup,
  @JsonValue('AdminSalaryView')
  adminSalaryView,
  @JsonValue('ColleagueSalaryView')
  colleagueSalaryView,
  @JsonValue('OnboardingPermission')
  onboardingPermission,
  @JsonValue('ViewStructure')
  viewStructure,
  @JsonValue('ChangeColleaguePermission')
  changeColleaguePermission,
  @JsonValue('ViewColleagueDetail')
  viewColleagueDetail,
  @JsonValue('CreateDepartment')
  createDepartment,
  @JsonValue('CreatePosition')
  createPosition,
  @JsonValue('CreateEvent')
  createEvent,
  @JsonValue('ChangeEventPermission')
  changeEventPermission,
  @JsonValue('ViewLeave')
  viewLeave,
  @JsonValue('RequestLeave')
  requestLeave,
  @JsonValue('GiveLeave')
  giveLeave,
  @JsonValue('CreateLeaveForm')
  createLeaveForm,
  @JsonValue('ViewOvertime')
  viewOvertime,
  @JsonValue('RequestOvertime')
  requestOvertime,
  @JsonValue('AssignOvertime')
  assignOvertime,
  @JsonValue('CreateOvertimeForm')
  createOvertimeForm,
  @JsonValue('ViewLate')
  viewLate,
  @JsonValue('AllowLate')
  allowLate,
  @JsonValue('ViewCalender')
  viewCalender,
  @JsonValue('ViewEarning')
  viewEarning,
  @JsonValue('CreateEarning')
  createEarning,
  @JsonValue('CreateEarningForm')
  createEarningForm,
  @JsonValue('ChangeEarningPermission')
  changeEarningPermission,
  @JsonValue('ViewDeduction')
  viewDeduction,
  @JsonValue('CreateDeduction')
  createDeduction,
  @JsonValue('CreateDeductionForm')
  createDeductionForm,
  @JsonValue('ChangeDeductionPermission')
  changeDeductionPermission,
  @JsonValue('ViewPermission')
  viewPermission,
  @JsonValue('ChangePermission')
  changePermission,
  @JsonValue('CreatePayroll')
  createPayroll,
  @JsonValue('ChangeCurrency')
  changeCurrency,
  @JsonValue('CreateCurrency')
  createCurrency,
}

enum ETypeCategory {
  @JsonValue('Event')
  event,
  @JsonValue('PaymentType')
  paymentType,
}

enum ERepeat {
  @JsonValue('Daily')
  daily,
  @JsonValue('WeekDay')
  weekDay,
  @JsonValue('NumDay')
  numDay,
  @JsonValue('MonthDay')
  monthDay,
}

enum EWeekDay {
  @JsonValue('Mon')
  mon,
  @JsonValue('Tue')
  tue,
  @JsonValue('Wed')
  wed,
  @JsonValue('Thurs')
  thurs,
  @JsonValue('Fri')
  fri,
  @JsonValue('Sat')
  sat,
  @JsonValue('Sun')
  sun,
}

enum EMonthDay {
  @JsonValue('FirstMonthDay')
  firstMonthDay,
  @JsonValue('LastMonthDay')
  lastMonthDay,
  @JsonValue('HalfMonthDay')
  halfMonthDay,
}

enum EExtra {
  @JsonValue('Salary')
  salary,
  @JsonValue('Absolute')
  absolute,
  @JsonValue('Percent')
  percent,
}

enum EMonth {
  @JsonValue('January')
  january,
  @JsonValue('February')
  february,
  @JsonValue('March')
  march,
  @JsonValue('April')
  april,
  @JsonValue('May')
  may,
  @JsonValue('June')
  june,
  @JsonValue('July')
  july,
  @JsonValue('August')
  august,
  @JsonValue('September')
  september,
  @JsonValue('October')
  october,
  @JsonValue('November')
  november,
  @JsonValue('December')
  december,
}
