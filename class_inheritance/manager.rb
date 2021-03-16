require_relative 'employee'
#sub class / child class
class Manager < Employee 

    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = [] #employees arg is an array of employee instances
    end

    def bonus(multiplier)
        total_salary = 0

        @employees.each do |employee|
            if employee.title == "Founder" || employee.title == "TA Manager"
                total_salary += employee.bonus(multiplier)
            else 
                total_salary += employee.salary
            end
        end
    end

     

end

#Ned --> Darren --> Shawna & David

shawna = Employee.new("shawna", "TA", 12000, "darren")
david = Employee.new("shawna", "TA", 10000, "darren")

employees = [shawna, david]
darren = Manager.new("darren", "TA Manager", "ned", employees)


