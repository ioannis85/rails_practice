class VolumetricWeightCalculator
    WEIGHT_VOLUME_CONSTANT =  5000
    INCHES_TO_CM = 2.54
    def self.force_to_kgs(width, height, lenght, unit )
     total_weight =  (width * (unit == "IN" ? INCHES_TO_CM : 1 ) * height * (unit == "IN" ? INCHES_TO_CM : 1 ) * lenght * (unit == "IN" ? INCHES_TO_CM : 1 ) ) / WEIGHT_VOLUME_CONSTANT
    end
end
