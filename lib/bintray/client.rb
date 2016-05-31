require 'bintray/repository'

module Bintray
  class Client
    def initialize(params)
      @params = params
      @api = API.new(@params[:endpoint],
                     @params[:user],
                     @params[:key])
    end

    def repo?(name, organization = nil)
      repo(name, organization)
      true
    rescue Error::NotFound
      false
    end

    def repo(name, organization = nil)
      Repository.new @api, @api.get("/repos/#{organization || @params[:user]}/#{name}")
    end
  end
end
