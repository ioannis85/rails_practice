class CarrierFactory
    attr_reader :availableCarriers, :label

    def initialize(label)
        @label = label
        @availableCarriers = {:FEDEX=> FedexCarrier.new(label) }
    end

    def get_carrier()
        carrier = @label[:carrier].to_sym
        selected_carrier = @availableCarriers[carrier]    
    end
end