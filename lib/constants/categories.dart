import '../models/category.dart';

final incomes = <Income>{
  Income('อื่นๆ', 'other_income'),
  Income('เงินเดือน', 'salary'),
  Income('ของขวัญ', 'gifts'),
  Income('ลงทุน', 'invest'),
};

final expenses = <Expense>{
  Expense('อื่นๆ', 'other'),
  Expense('อาหารกลางวัน', 'lunch'),
  Expense('อาหารเย็น', 'dinner'),
  Expense('อาหารเช้า', 'breakfast'),
  Expense('ผงชักฟอก', 'laundry'),
  Expense('ขนส่ง', 'transport'),
  Expense('เติมน้ำมัน', 'refuel'),
};
