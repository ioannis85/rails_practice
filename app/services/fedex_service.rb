require 'fedex'
class FedexService
    attr_accessor :fedex_client
    def initialize()
        fedex_configuration = Rails.configuration.fedex
        @fedex_client = Fedex::Shipment.new(fedex_configuration)
    end


    def tracking(tracking_number)
      results = @fedex_client.track(:tracking_number=> tracking_number)
      tracking_info = results.first
      details = { :label_type=> 'FEDEX', :tracking_number=>tracking_info.tracking_number,:package_weight=> tracking_info.details[:package_weight],
      :package_dimensions => tracking_info.details[:package_dimensions]
     }

    end
    
end