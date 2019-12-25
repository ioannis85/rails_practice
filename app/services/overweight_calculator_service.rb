class  OverweightCalculatorService
    attr_reader :fedex_service 
    def initialize()
    @fedex_service = FedexService.new
    end

    def calculate (labels)
      result =  Parallel.map(labels) do |label|
        new_label = Label.new 
        new_label.tracking_number = label[:tracking_number]
         carrier_factory = CarrierFactory.new(label)
         carrier = carrier_factory.get_carrier
         label_total_weight = carrier.calculate_total_weight
         new_label.total_weight = label_total_weight
         carrier_total_weight = carrier.calculate_carrier_total_weight 
         new_label.total_weight_carrier = carrier_total_weight
         overheight = carrier_total_weight - label_total_weight
         new_label.overweight =  overheight
         new_label        
        end
        Label.import result 
        result
    end
end