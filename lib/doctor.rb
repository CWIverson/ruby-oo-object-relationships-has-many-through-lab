class Doctor
    @@all=[]
    attr_reader :name
    def initialize(name)
        @name=name
        @appointments=[]
        @@all<<self
    end
    def self.all
        @@all
    end
    def appointments
        Appointment.all.each do |appointment|
           if appointment.doctor == self && !(@appointments.include?(appointment))
                @appointments<<appointment
           end
        end
        @appointments
    end
    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end
    def patients
        appointments.map do |appointment|
            appointment.patient
        end
    end
end
