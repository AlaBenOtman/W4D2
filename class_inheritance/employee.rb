class Employee #superclass / parent class

    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss #Manager ivar
        set_employees
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

    def set_employees
        unless @boss.nil?
            @boss.employees << self
        end
    end

end