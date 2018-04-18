class Employee
  attr_reader :name, :title, :boss, :subordinates
  attr_accessor :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    @subordinates = []
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

  def add_sub=(subordinate)
    @subordinates << subordinate unless @subordinates.include?(subordinate)
    subordinate.boss = self
  end
end


class Manager < Employee
  def bonus(multiplier)
    # bonus = total_sub_salaries(@subordinates.dup) * multiplier

    total_sub_salaries = 0
    subs = all_subs(@subordinates.dup).flatten
    subs.each do |employee|
      total_sub_salaries += employee.salary
    end

    total_sub_salaries * multiplier

  end

  private
  def all_subs(subordinates)
    result = []
    subordinates.each do |subordinate|
      result << all_subs(subordinate)
    end
  end
end

def test
  ned = Manager.new("Ned", "Superboss", 1_000_000, nil)
  daren = Manager.new("Darren", "TA Manager", 78_000, ned)
  shawna = Employee.new("Shawna", "TA", 12_000, daren)
  david = Employee.new("David", "TA", 10_000, daren)
end
