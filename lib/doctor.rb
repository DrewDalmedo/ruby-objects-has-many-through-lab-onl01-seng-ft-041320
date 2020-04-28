class Doctor
    attr_accessor :name, :appointments, :patients

    @@all = []

    def initialize(name)
        @name = name
        @appointments = []
        @patients = []

        @@all << self
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def patients
        appointments.each do |appointment|
            @patients << appointment.patient if !( @patients.include?(appointment.patient) )
        end

        @patients
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def self.all
        @@all
    end
end