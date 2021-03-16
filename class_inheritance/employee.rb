class Employee #superclass / parent class

    def initialize(name, title, salary, boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

    def boss=(manager) #######
        if !@boss.nil?
            @boss.employees << self
        end

    end

end