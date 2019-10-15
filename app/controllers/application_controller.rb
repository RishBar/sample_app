class ApplicationController < ActionController::Base
    def yo_dul
        render html: "yo dul!"
    end

    before_action :block_ip_addresses
      
    protected
      
    def block_ip_addresses
        logger.debug "your ip address is #{current_ip_address}"
        head :unauthorized if current_ip_address == "162.156.172.219"
    end
      
    def current_ip_address
        request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
    end

end
