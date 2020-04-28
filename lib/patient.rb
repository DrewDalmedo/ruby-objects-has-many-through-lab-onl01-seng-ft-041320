require 'pry'
class Patient
    attr_accessor :name, :appointments, :doctors

    @@all = []

    def initialize(name)
        @name = name
        @appointments = []
        @doctors = []

        @@all << self
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select {|appointment| appointment.patient == self}
    end

    def doctors
        #binding.pry

        appointments.each do |appointment|
            @doctors << appointment.doctor if !( @doctors.include?(appointment.doctor) )
        end

        @doctors
    end

    def self.all
        @@all
    end
end