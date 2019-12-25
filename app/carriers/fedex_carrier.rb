class FedexCarrier
    attr_reader :fedex_service, :label 
    def initialize(label)
        @fedex_service = FedexService.new
        @label = label
    end

    def calculate_total_weight
        label_weight =  get_weight_label
        label_weight_unit = get_mass_unit_label
        label_weight_kgs = WeightConvertor.force_to_kgs(label_weight, label_weight_unit)
        label_volumetric_weight = volumetric_weight
        total_weight =  (label_weight_kgs >  label_volumetric_weight ? label_weight_kgs : label_volumetric_weight).ceil 
    end   

    def calculate_carrier_total_weight
        tracking_number = @label[:tracking_number]
        fedex_label = @fedex_service.tracking(tracking_number)
        fedex_weight = fedex_label[:package_weight][:weight].to_f
        fedex_unit = fedex_label[:package_weight][:units]
        fedex_weight_kgs = WeightConvertor.force_to_kgs(fedex_weight, fedex_unit)
        fedex_volumetric_weight = VolumetricWeightCalculator.force_to_kgs(
         fedex_label[:package_dimensions][:width].to_f,
         fedex_label[:package_dimensions][:height].to_f, 
         fedex_label[:package_dimensions][:length].to_f,
         fedex_label[:package_dimensions][:units])
         fedex_total_weight = (fedex_weight_kgs > fedex_volumetric_weight ? fedex_weight_kgs : fedex_volumetric_weight).ceil
    end


private 

    def get_mass_unit_label
        @label[:parcel][:mass_unit]
    end

    def get_weight_label
        @label[:parcel][:weight].to_f
    end

    def volumetric_weight
        VolumetricWeightCalculator.force_to_kgs(
            @label[:parcel][:width].to_f,
            @label[:parcel][:height].to_f, 
            @label[:parcel][:length].to_f,
            @label[:parcel][:distance_unit] 
            )
    end





end