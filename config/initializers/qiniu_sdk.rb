#!/user/bin/env ruby
require 'qiniu'

Qiniu.establish_connection! :access_key => '<EacKuPVwUX9pxvFG4qpN7YzLCkZierovOrJCAbOs>',
                            :secret_key => '<YqimgOX4ylsisdkg12i9WWc5AF2mC3IgWXc6G2_O>'
Rails.application.config.qiniu_domain = "<op1pcc4aq.bkt.clouddn.com>"
