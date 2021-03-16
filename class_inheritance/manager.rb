require 'byebug'
require_relative 'employee'
#sub class / child class
class Manager < Employee 

    attr_reader :employees
    def initialize(name, title, salary, boss=nil)
        super#(name, title, salary, boss)
        @employees = [] #employees arg is an array of employee instances
    end

    def bonus(multiplier)
        total_salary = 0
        # need to fix loop... multiplying total_salary at every recursive call...
        # method should only multiply once at the end.
        @employees.each do |employee|
            # debugger
            if employee.title == "Founder"
                total_salary += employee.bonus(multiplier)
            elsif employee.title == "TA Manager"
                total_salary += employee.bonus(multiplier) 
            else 
                total_salary += employee.salary
            end
        end
        total_salary * multiplier
    end
end

#Ned --> Darren --> Shawna & David

# employees = [shawna, david]
ned = Manager.new("ned", "Founder", 1000000, nil)
darren = Manager.new("darren", "TA Manager", 78000, ned)
shawna = Employee.new("shawna", "TA", 12000, darren)
david = Employee.new("shawna", "TA", 10000, darren)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000