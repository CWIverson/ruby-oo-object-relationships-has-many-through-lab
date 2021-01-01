class Patient
    @@all=[]
    attr_reader :appointments
    def initialize(name)
        @name = name
        @@all <<self
        @appointments=[]
    end
    def self.all
        @@all
    end
    def appointments
        Appointment.all.each do |appointment|
            if appointment.patient == self && !(@appointments.include?(appointment))
                @appointments<<appointment
            end
        end
        @appointments
    end
    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end
    def doctors
        appointments.map do |appointment|
            appointment.doctor
        end
    end
end
