require('rubygems')
require('net/http')
require('uri')

require('candlepin-api/base')
require('candlepin-api/entrypoint-extensions')

module CandlepinAPI

  #
  # REST endpoint definition
  #
  class Endpoint_ < Endpoint

    URI_Regex_String	= '^/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_
  #
  class GetRootResources < Endpoint_
    #
    # GET /candlepin/
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RootResource.getRootResources'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getRootResources
    end

  end  # REST entrypoint class GetRootResources

  #
  # REST endpoint definition
  #
  class Endpoint_Activation_Keys_by_Activation_Key_Id < Endpoint

    URI_Regex_String	= '^activation_keys/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'activation_key_id',
			  ]
    attr_accessor(:activation_key_id)
    PathMap		= PathMap.merge({
					  'activation_key_id' => 'activation_key_id'
					})
    VerifiedParams	= [
			   'activation_key_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Activation_Keys_by_Activation_Key_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Activation_Keys_by_Activation_Key_Id
  #
  class DeleteActivationKey < Endpoint_Activation_Keys_by_Activation_Key_Id
    #
    # DELETE /candlepin/activation_keys/{activation_key_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.deleteActivationKey'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :deleteActivationKey
    end

  end  # REST entrypoint class DeleteActivationKey

  class GetActivationKey < Endpoint_Activation_Keys_by_Activation_Key_Id
    #
    # GET /candlepin/activation_keys/{activation_key_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.getActivationKey'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :getActivationKey
    end

  end  # REST entrypoint class GetActivationKey

  class UpdateActivationKey < Endpoint_Activation_Keys_by_Activation_Key_Id
    #
    # PUT /candlepin/activation_keys/{activation_key_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.updateActivationKey'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :updateActivationKey
    end

  end  # REST entrypoint class UpdateActivationKey

  #
  # REST endpoint definition
  #
  class Endpoint_Activation_Keys_by_Activation_Key_Id_Pools_by_Pool_Id < Endpoint

    URI_Regex_String	= '^activation_keys/([^/]+)/pools/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'activation_key_id',
			   'pool_id',
			  ]
    attr_accessor(:activation_key_id)
    attr_accessor(:pool_id)
    PathMap		= PathMap.merge({
					  'activation_key_id' => 'activation_key_id',
					  'pool_id' => 'pool_id'
					})
    VerifiedParams	= [
			   'activation_key_id',
			   'pool_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Activation_Keys_by_Activation_Key_Id_Pools_by_Pool_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Activation_Keys_by_Activation_Key_Id_Pools_by_Pool_Id
  #
  class AddPoolToKeyActivationKey < Endpoint_Activation_Keys_by_Activation_Key_Id_Pools_by_Pool_Id
    #
    # POST /candlepin/activation_keys/{activation_key_id}/pools/{pool_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.addPoolToKey'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]
    QueryParams		= [
			    'quantity',
			  ]
    QueryMap		= QueryMap.merge({
					   'quantity' => 'quantity',
					 })
    attr_accessor(:quantity)

    def rqtype
      return :addPoolToKeyActivationKey
    end

  end  # REST entrypoint class AddPoolToKeyActivationKey

  class RemovePoolFromKeyActivationKey < Endpoint_Activation_Keys_by_Activation_Key_Id_Pools_by_Pool_Id
    #
    # DELETE /candlepin/activation_keys/{activation_key_id}/pools/{pool_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.removePoolFromKey'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :removePoolFromKeyActivationKey
    end

  end  # REST entrypoint class RemovePoolFromKeyActivationKey

  #
  # REST endpoint definition
  #
  class Endpoint_Activation_Keys_by_Activation_Key_Id_Pools < Endpoint

    URI_Regex_String	= '^activation_keys/([^/]+)/pools/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'activation_key_id',
			  ]
    attr_accessor(:activation_key_id)
    PathMap		= PathMap.merge({
					  'activation_key_id' => 'activation_key_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Activation_Keys_by_Activation_Key_Id_Pools

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Activation_Keys_by_Activation_Key_Id_Pools
  #
  class GetActivationKeyPools < Endpoint_Activation_Keys_by_Activation_Key_Id_Pools
    #
    # GET /candlepin/activation_keys/{activation_key_id}/pools
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.getActivationKeyPools'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :getActivationKeyPools
    end

  end  # REST entrypoint class GetActivationKeyPools

  #
  # REST endpoint definition
  #
  class Endpoint_Activation_Keys < Endpoint

    URI_Regex_String	= '^activation_keys/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Activation_Keys

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Activation_Keys
  #
  class FindActivationKey < Endpoint_Activation_Keys
    #
    # GET /candlepin/activation_keys
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ActivationKeyResource.findActivationKey'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :findActivationKey
    end

  end  # REST entrypoint class FindActivationKey

  #
  # REST endpoint definition
  #
  class Endpoint_Admin_Init < Endpoint

    URI_Regex_String	= '^admin/init/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Admin_Init

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Admin_Init
  #
  class InitializeAdmin < Endpoint_Admin_Init
    #
    # GET /candlepin/admin/init
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.AdminResource.initialize'

    #
    #  Currently this just creates the admin user for standalone deployments using the
    # default user service adapter. It must be called once after candlepin is installed,
    # repeat calls are not required, but will be harmless.
    #

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :initializeAdmin
    end

  end  # REST entrypoint class InitializeAdmin

  #
  # REST endpoint definition
  #
  class Endpoint_Atom < Endpoint

    URI_Regex_String	= '^atom/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Atom

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Atom
  #
  class GetFeedAtomFeed < Endpoint_Atom
    #
    # GET /candlepin/atom
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.AtomFeedResource.getFeed'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getFeedAtomFeed
    end

  end  # REST entrypoint class GetFeedAtomFeed

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid
  #
  class DeleteConsumer < Endpoint_Consumers_by_Consumer_Uuid
    #
    # DELETE /candlepin/consumers/{consumer_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.deleteConsumer'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 403, 404, 200 ]

    def rqtype
      return :deleteConsumer
    end

  end  # REST entrypoint class DeleteConsumer

  class GetConsumer < Endpoint_Consumers_by_Consumer_Uuid
    #
    # GET /candlepin/consumers/{consumer_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getConsumer'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getConsumer
    end

  end  # REST entrypoint class GetConsumer

  class RegenerateIdentityCertificatesConsumer < Endpoint_Consumers_by_Consumer_Uuid
    #
    # POST /candlepin/consumers/{consumer_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.regenerateIdentityCertificates'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]

    def rqtype
      return :regenerateIdentityCertificatesConsumer
    end

  end  # REST entrypoint class RegenerateIdentityCertificatesConsumer

  class UpdateConsumer < Endpoint_Consumers_by_Consumer_Uuid
    #
    # PUT /candlepin/consumers/{consumer_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.updateConsumer'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :updateConsumer
    end

  end  # REST entrypoint class UpdateConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Certificates_by_Serial_Id < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/certificates/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			   'serial',
			  ]
    attr_accessor(:consumer_uuid)
    attr_accessor(:serial_id)
    alias_method(:serial, :serial_id)
    alias_method(:serial=, :serial_id=)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid',
					  'serial' => 'serial_id'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Certificates_by_Serial_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Certificates_by_Serial_Id
  #
  class UnbindBySerialConsumer < Endpoint_Consumers_by_Consumer_Uuid_Certificates_by_Serial_Id
    #
    # DELETE /candlepin/consumers/{consumer_uuid}/certificates/{serial}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.unbindBySerial'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 403, 404, 200 ]

    def rqtype
      return :unbindBySerialConsumer
    end

  end  # REST entrypoint class UnbindBySerialConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Certificates < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/certificates/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Certificates

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Certificates
  #
  class GetEntitlementCertificatesConsumer < Endpoint_Consumers_by_Consumer_Uuid_Certificates
    #
    # GET /candlepin/consumers/{consumer_uuid}/certificates
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getEntitlementCertificates'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]
    QueryParams		= [
			    'serials',
			  ]
    QueryMap		= QueryMap.merge({
					   'serials' => 'serials',
					 })
    attr_accessor(:serials)

    def rqtype
      return :getEntitlementCertificatesConsumer
    end

  end  # REST entrypoint class GetEntitlementCertificatesConsumer

  class RegenerateEntitlementCertificatesConsumer < Endpoint_Consumers_by_Consumer_Uuid_Certificates
    #
    # PUT /candlepin/consumers/{consumer_uuid}/certificates
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.regenerateEntitlementCertificates'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]
    QueryParams		= [
			    'entitlement',
			    'lazy_regen',
			  ]
    QueryMap		= QueryMap.merge({
					   'entitlement' => 'entitlement_id',
					   'lazy_regen' => 'lazy_regen',
					 })
    attr_accessor(:entitlement)
    attr_accessor(:lazy_regen)

    def rqtype
      return :regenerateEntitlementCertificatesConsumer
    end

  end  # REST entrypoint class RegenerateEntitlementCertificatesConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Certificates_Serials < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/certificates/serials/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Certificates_Serials

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Certificates_Serials
  #
  class GetEntitlementCertificateSerialsConsumer < Endpoint_Consumers_by_Consumer_Uuid_Certificates_Serials
    #
    # GET /candlepin/consumers/{consumer_uuid}/certificates/serials
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getEntitlementCertificateSerials'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getEntitlementCertificateSerialsConsumer
    end

  end  # REST entrypoint class GetEntitlementCertificateSerialsConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Compliance < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/compliance/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Compliance

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Compliance
  #
  class GetComplianceStatusConsumer < Endpoint_Consumers_by_Consumer_Uuid_Compliance
    #
    # GET /candlepin/consumers/{consumer_uuid}/compliance
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getComplianceStatus'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]
    QueryParams		= [
			    'on_date',
			  ]
    QueryMap		= QueryMap.merge({
					   'on_date' => 'on_date',
					 })
    attr_accessor(:on_date)

    def rqtype
      return :getComplianceStatusConsumer
    end

  end  # REST entrypoint class GetComplianceStatusConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Deletionrecord < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/deletionrecord/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Deletionrecord

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Deletionrecord
  #
  class RemoveDeletionRecordConsumer < Endpoint_Consumers_by_Consumer_Uuid_Deletionrecord
    #
    # DELETE /candlepin/consumers/{consumer_uuid}/deletionrecord
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.removeDeletionRecord'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]

    def rqtype
      return :removeDeletionRecordConsumer
    end

  end  # REST entrypoint class RemoveDeletionRecordConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Entitlements_by_Entitlement_Id < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/entitlements/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			   'dbid',
			  ]
    attr_accessor(:consumer_uuid)
    attr_accessor(:entitlement_id)
    alias_method(:dbid, :entitlement_id)
    alias_method(:dbid=, :entitlement_id=)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid',
					  'dbid' => 'entitlement_id'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Entitlements_by_Entitlement_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Entitlements_by_Entitlement_Id
  #
  class UnbindConsumer < Endpoint_Consumers_by_Consumer_Uuid_Entitlements_by_Entitlement_Id
    #
    # DELETE /candlepin/consumers/{consumer_uuid}/entitlements/{dbid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.unbind'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 403, 404, 200 ]

    def rqtype
      return :unbindConsumer
    end

  end  # REST entrypoint class UnbindConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Entitlements < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/entitlements/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Entitlements

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Entitlements
  #
  class BindConsumer < Endpoint_Consumers_by_Consumer_Uuid_Entitlements
    #
    # POST /candlepin/consumers/{consumer_uuid}/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.bind'

    #
    #  If a pool ID is specified, we know we're binding to that exact pool. Specifying
    # an entitle date in this case makes no sense and will throw an error.
    #

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 403, 404, 200 ]
    QueryParams		= [
			    'pool',
			    'product',
			    'quantity',
			    'email',
			    'email_locale',
			    'async',
			    'entitle_date',
			  ]
    QueryMap		= QueryMap.merge({
					   'async' => 'async',
					   'email' => 'email',
					   'email_locale' => 'email_locale',
					   'entitle_date' => 'entitle_date',
					   'pool' => 'pool_id',
					   'product' => 'product_id',
					   'quantity' => 'quantity',
					 })
    attr_accessor(:pool)
    attr_accessor(:product)
    attr_accessor(:quantity)
    attr_accessor(:email)
    attr_accessor(:email_locale)
    attr_accessor(:async)
    attr_accessor(:entitle_date)

    def rqtype
      return :bindConsumer
    end

  end  # REST entrypoint class BindConsumer

  class ListEntitlementsConsumer < Endpoint_Consumers_by_Consumer_Uuid_Entitlements
    #
    # GET /candlepin/consumers/{consumer_uuid}/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.listEntitlements'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'product',
			  ]
    QueryMap		= QueryMap.merge({
					   'product' => 'product_id',
					 })
    attr_accessor(:product)

    def rqtype
      return :listEntitlementsConsumer
    end

  end  # REST entrypoint class ListEntitlementsConsumer

  class UnbindAllConsumer < Endpoint_Consumers_by_Consumer_Uuid_Entitlements
    #
    # DELETE /candlepin/consumers/{consumer_uuid}/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.unbindAll'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :unbindAllConsumer
    end

  end  # REST entrypoint class UnbindAllConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Entitlements_Dry_Run < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/entitlements/dry-run/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Entitlements_Dry_Run

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Entitlements_Dry_Run
  #
  class DryBindConsumer < Endpoint_Consumers_by_Consumer_Uuid_Entitlements_Dry_Run
    #
    # GET /candlepin/consumers/{consumer_uuid}/entitlements/dry-run
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.dryBind'

    #
    #  This is a dry run of an autobind. It allows the client to see what would be the
    # result of an autobind without executing it. It can only do this for the prevously
    # established list of installed products for the consumer
    #

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 403, 404, 200 ]
    QueryParams		= [
			    'service_level',
			  ]
    QueryMap		= QueryMap.merge({
					   'service_level' => 'service_level',
					 })
    attr_accessor(:service_level)

    def rqtype
      return :dryBindConsumer
    end

  end  # REST entrypoint class DryBindConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Events < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/events/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Events

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Events
  #
  class GetConsumerEvents < Endpoint_Consumers_by_Consumer_Uuid_Events
    #
    # GET /candlepin/consumers/{consumer_uuid}/events
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getConsumerEvents'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getConsumerEvents
    end

  end  # REST entrypoint class GetConsumerEvents

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Export < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/export/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Export

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Export
  #
  class ExportDataConsumer < Endpoint_Consumers_by_Consumer_Uuid_Export
    #
    # GET /candlepin/consumers/{consumer_uuid}/export
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.exportData'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 403, 500, 404, 200 ]

    def rqtype
      return :exportDataConsumer
    end

  end  # REST entrypoint class ExportDataConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Guests < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/guests/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Guests

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Guests
  #
  class GetGuestsConsumer < Endpoint_Consumers_by_Consumer_Uuid_Guests
    #
    # GET /candlepin/consumers/{consumer_uuid}/guests
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getGuests'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getGuestsConsumer
    end

  end  # REST entrypoint class GetGuestsConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Host < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/host/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Host

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Host
  #
  class GetHostConsumer < Endpoint_Consumers_by_Consumer_Uuid_Host
    #
    # GET /candlepin/consumers/{consumer_uuid}/host
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getHost'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getHostConsumer
    end

  end  # REST entrypoint class GetHostConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Owner < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/owner/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Owner

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Owner
  #
  class GetOwnerConsumer < Endpoint_Consumers_by_Consumer_Uuid_Owner
    #
    # GET /candlepin/consumers/{consumer_uuid}/owner
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getOwner'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getOwnerConsumer
    end

  end  # REST entrypoint class GetOwnerConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_by_Consumer_Uuid_Release < Endpoint

    URI_Regex_String	= '^consumers/([^/]+)/release/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			  ]
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid'
					})
    VerifiedParams	= [
			   'consumer_uuid',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_by_Consumer_Uuid_Release

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_by_Consumer_Uuid_Release
  #
  class GetReleaseConsumer < Endpoint_Consumers_by_Consumer_Uuid_Release
    #
    # GET /candlepin/consumers/{consumer_uuid}/release
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getRelease'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]

    def rqtype
      return :getReleaseConsumer
    end

  end  # REST entrypoint class GetReleaseConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers < Endpoint

    URI_Regex_String	= '^consumers/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers
  #
  class CreateConsumer < Endpoint_Consumers
    #
    # POST /candlepin/consumers
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.create'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    API_Flags		= API_Flags.merge({
				  :can_create_owner => true
				})
    HTTPStatusCodes	= [ 400, 403, 404, 200 ]
    QueryParams		= [
			    'username',
			    'owner',
			    'activation_keys',
			  ]
    QueryMap		= QueryMap.merge({
					   'activation_keys' => 'activation_keys',
					   'owner' => 'org_id',
					   'username' => 'username',
					 })
    attr_accessor(:username)
    attr_accessor(:owner)
    attr_accessor(:activation_keys)

    def rqtype
      return :createConsumer
    end

  end  # REST entrypoint class CreateConsumer

  class ListConsumer < Endpoint_Consumers
    #
    # GET /candlepin/consumers
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'username',
			    'type',
			    'owner',
			    'uuid',
			  ]
    QueryMap		= QueryMap.merge({
					   'owner' => 'org_id',
					   'type' => 'type',
					   'username' => 'username',
					   'uuid' => 'uuid',
					 })
    attr_accessor(:username)
    attr_accessor(:type)
    attr_accessor(:owner)
    attr_accessor(:uuid)

    def rqtype
      return :listConsumer
    end

  end  # REST entrypoint class ListConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumers_Compliance < Endpoint

    URI_Regex_String	= '^consumers/compliance/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumers_Compliance

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumers_Compliance
  #
  class GetComplianceStatusListConsumer < Endpoint_Consumers_Compliance
    #
    # GET /candlepin/consumers/compliance
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerResource.getComplianceStatusList'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]
    QueryParams		= [
			    'uuid',
			  ]
    QueryMap		= QueryMap.merge({
					   'uuid' => 'uuid',
					 })
    attr_accessor(:uuid)

    def rqtype
      return :getComplianceStatusListConsumer
    end

  end  # REST entrypoint class GetComplianceStatusListConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Consumertypes_by_Consumertype_Id < Endpoint

    URI_Regex_String	= '^consumertypes/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'id',
			  ]
    attr_accessor(:consumertype_id)
    alias_method(:id, :consumertype_id)
    alias_method(:id=, :consumertype_id=)
    PathMap		= PathMap.merge({
					  'id' => 'consumertype_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumertypes_by_Consumertype_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumertypes_by_Consumertype_Id
  #
  class DeleteConsumerType < Endpoint_Consumertypes_by_Consumertype_Id
    #
    # DELETE /candlepin/consumertypes/{id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerTypeResource.deleteConsumerType'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :deleteConsumerType
    end

  end  # REST entrypoint class DeleteConsumerType

  class GetConsumerType < Endpoint_Consumertypes_by_Consumertype_Id
    #
    # GET /candlepin/consumertypes/{id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerTypeResource.getConsumerType'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getConsumerType
    end

  end  # REST entrypoint class GetConsumerType

  class UpdateConsumerType < Endpoint_Consumertypes_by_Consumertype_Id
    #
    # PUT /candlepin/consumertypes/{id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerTypeResource.update'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :updateConsumerType
    end

  end  # REST entrypoint class UpdateConsumerType

  #
  # REST endpoint definition
  #
  class Endpoint_Consumertypes < Endpoint

    URI_Regex_String	= '^consumertypes/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Consumertypes

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Consumertypes
  #
  class CreateConsumerType < Endpoint_Consumertypes
    #
    # POST /candlepin/consumertypes
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerTypeResource.create'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :createConsumerType
    end

  end  # REST entrypoint class CreateConsumerType

  class ListConsumerType < Endpoint_Consumertypes
    #
    # GET /candlepin/consumertypes
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ConsumerTypeResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :listConsumerType
    end

  end  # REST entrypoint class ListConsumerType

  #
  # REST endpoint definition
  #
  class Endpoint_Content_by_Content_Id < Endpoint

    URI_Regex_String	= '^content/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'content_id',
			  ]
    attr_accessor(:content_id)
    PathMap		= PathMap.merge({
					  'content_id' => 'content_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Content_by_Content_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Content_by_Content_Id
  #
  class GetContent < Endpoint_Content_by_Content_Id
    #
    # GET /candlepin/content/{content_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ContentResource.getContent'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400 ]

    def rqtype
      return :getContent
    end

  end  # REST entrypoint class GetContent

  class RemoveContent < Endpoint_Content_by_Content_Id
    #
    # DELETE /candlepin/content/{content_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ContentResource.remove'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :removeContent
    end

  end  # REST entrypoint class RemoveContent

  class UpdateContent < Endpoint_Content_by_Content_Id
    #
    # PUT /candlepin/content/{content_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ContentResource.updateContent'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]

    def rqtype
      return :updateContent
    end

  end  # REST entrypoint class UpdateContent

  #
  # REST endpoint definition
  #
  class Endpoint_Content < Endpoint

    URI_Regex_String	= '^content/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Content

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Content
  #
  class CreateContent < Endpoint_Content
    #
    # POST /candlepin/content
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ContentResource.createContent'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :createContent
    end

  end  # REST entrypoint class CreateContent

  class ListContent < Endpoint_Content
    #
    # GET /candlepin/content
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ContentResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :listContent
    end

  end  # REST entrypoint class ListContent

  #
  # REST endpoint definition
  #
  class Endpoint_Crl < Endpoint

    URI_Regex_String	= '^crl/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Crl

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Crl
  #
  class GetCurrentCrl < Endpoint_Crl
    #
    # GET /candlepin/crl
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.CrlResource.getCurrentCrl'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getCurrentCrl
    end

  end  # REST entrypoint class GetCurrentCrl

  class UnrevokeCrl < Endpoint_Crl
    #
    # DELETE /candlepin/crl
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.CrlResource.unrevoke'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]
    QueryParams		= [
			    'serial',
			  ]
    QueryMap		= QueryMap.merge({
					   'serial' => 'serial',
					 })
    attr_accessor(:serial)

    def rqtype
      return :unrevokeCrl
    end

  end  # REST entrypoint class UnrevokeCrl

  #
  # REST endpoint definition
  #
  class Endpoint_Deleted_Consumers < Endpoint

    URI_Regex_String	= '^deleted_consumers/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Deleted_Consumers

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Deleted_Consumers
  #
  class ListByDateDeletedConsumer < Endpoint_Deleted_Consumers
    #
    # GET /candlepin/deleted_consumers
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.DeletedConsumerResource.listByDate'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'date',
			  ]
    QueryMap		= QueryMap.merge({
					   'date' => 'date',
					 })
    attr_accessor(:date)

    def rqtype
      return :listByDateDeletedConsumer
    end

  end  # REST entrypoint class ListByDateDeletedConsumer

  #
  # REST endpoint definition
  #
  class Endpoint_Distributor_Versions_by_Id < Endpoint

    URI_Regex_String	= '^distributor_versions/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'id',
			  ]
    attr_accessor(:id)
    PathMap		= PathMap.merge({
					  'id' => 'id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Distributor_Versions_by_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Distributor_Versions_by_Id
  #
  class DeleteDistributorVersion < Endpoint_Distributor_Versions_by_Id
    #
    # DELETE /candlepin/distributor_versions/{id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.DistributorVersionResource.delete'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]

    def rqtype
      return :deleteDistributorVersion
    end

  end  # REST entrypoint class DeleteDistributorVersion

  class UpdateDistributorVersion < Endpoint_Distributor_Versions_by_Id
    #
    # PUT /candlepin/distributor_versions/{id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.DistributorVersionResource.update'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :updateDistributorVersion
    end

  end  # REST entrypoint class UpdateDistributorVersion

  #
  # REST endpoint definition
  #
  class Endpoint_Distributor_Versions < Endpoint

    URI_Regex_String	= '^distributor_versions/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Distributor_Versions

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Distributor_Versions
  #
  class CreateDistributorVersion < Endpoint_Distributor_Versions
    #
    # POST /candlepin/distributor_versions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.DistributorVersionResource.create'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :createDistributorVersion
    end

  end  # REST entrypoint class CreateDistributorVersion

  class GetVersionsDistributorVersion < Endpoint_Distributor_Versions
    #
    # GET /candlepin/distributor_versions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.DistributorVersionResource.getVersions'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]
    QueryParams		= [
			    'name_search',
			    'capability',
			  ]
    QueryMap		= QueryMap.merge({
					   'capability' => 'capability',
					   'name_search' => 'name_search',
					 })
    attr_accessor(:name_search)
    attr_accessor(:capability)

    def rqtype
      return :getVersionsDistributorVersion
    end

  end  # REST entrypoint class GetVersionsDistributorVersion

  #
  # REST endpoint definition
  #
  class Endpoint_Entitlements_by_Entitlement_Id < Endpoint

    URI_Regex_String	= '^entitlements/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'dbid',
			   'entitlement_id',
			  ]
    attr_accessor(:entitlement_id)
    alias_method(:dbid, :entitlement_id)
    alias_method(:dbid=, :entitlement_id=)
    attr_accessor(:entitlement_id)
    PathMap		= PathMap.merge({
					  'dbid' => 'entitlement_id',
					  'entitlement_id' => 'entitlement_id'
					})
    VerifiedParams	= [
			   'entitlement_id',
			   'entitlement_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Entitlements_by_Entitlement_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Entitlements_by_Entitlement_Id
  #
  class GetEntitlement < Endpoint_Entitlements_by_Entitlement_Id
    #
    # GET /candlepin/entitlements/{entitlement_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.getEntitlement'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getEntitlement
    end

  end  # REST entrypoint class GetEntitlement

  class UnbindEntitlement < Endpoint_Entitlements_by_Entitlement_Id
    #
    # DELETE /candlepin/entitlements/{entitlement_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.unbind'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 403, 404, 200 ]

    def rqtype
      return :unbindEntitlement
    end

  end  # REST entrypoint class UnbindEntitlement

  class UpdateEntitlement < Endpoint_Entitlements_by_Entitlement_Id
    #
    # PUT /candlepin/entitlements/{entitlement_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.updateEntitlement'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :updateEntitlement
    end

  end  # REST entrypoint class UpdateEntitlement

  #
  # REST endpoint definition
  #
  class Endpoint_Entitlements_by_Dbid_Upstream_Cert < Endpoint

    URI_Regex_String	= '^entitlements/([^/]+)/upstream_cert/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'dbid',
			  ]
    attr_accessor(:dbid)
    PathMap		= PathMap.merge({
					  'dbid' => 'dbid'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Entitlements_by_Dbid_Upstream_Cert

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Entitlements_by_Dbid_Upstream_Cert
  #
  class GetEntitlementUpstreamCert < Endpoint_Entitlements_by_Dbid_Upstream_Cert
    #
    # GET /candlepin/entitlements/{dbid}/upstream_cert
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.getEntitlementUpstreamCert'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getEntitlementUpstreamCert
    end

  end  # REST entrypoint class GetEntitlementUpstreamCert

  #
  # REST endpoint definition
  #
  class Endpoint_Entitlements < Endpoint

    URI_Regex_String	= '^entitlements/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Entitlements

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Entitlements
  #
  class ListAllForConsumerEntitlement < Endpoint_Entitlements
    #
    # GET /candlepin/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.listAllForConsumer'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]
    QueryParams		= [
			    'consumer',
			  ]
    QueryMap		= QueryMap.merge({
					   'consumer' => 'consumer_uuid',
					 })
    attr_accessor(:consumer)

    def rqtype
      return :listAllForConsumerEntitlement
    end

  end  # REST entrypoint class ListAllForConsumerEntitlement

  #
  # REST endpoint definition
  #
  class Endpoint_Entitlements_Consumer_by_Consumer_Uuid_Product_by_Product_Id < Endpoint

    URI_Regex_String	= '^entitlements/consumer/([^/]+)/product/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'consumer_uuid',
			   'product_id',
			  ]
    attr_accessor(:consumer_uuid)
    attr_accessor(:product_id)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid',
					  'product_id' => 'product_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Entitlements_Consumer_by_Consumer_Uuid_Product_by_Product_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Entitlements_Consumer_by_Consumer_Uuid_Product_by_Product_Id
  #
  class HasEntitlement < Endpoint_Entitlements_Consumer_by_Consumer_Uuid_Product_by_Product_Id
    #
    # GET /candlepin/entitlements/consumer/{consumer_uuid}/product/{product_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.hasEntitlement'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :hasEntitlement
    end

  end  # REST entrypoint class HasEntitlement

  #
  # REST endpoint definition
  #
  class Endpoint_Entitlements_Product_by_Product_Id < Endpoint

    URI_Regex_String	= '^entitlements/product/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'product_id',
			  ]
    attr_accessor(:product_id)
    PathMap		= PathMap.merge({
					  'product_id' => 'product_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Entitlements_Product_by_Product_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Entitlements_Product_by_Product_Id
  #
  class RegenerateEntitlementCertificatesForProduct < Endpoint_Entitlements_Product_by_Product_Id
    #
    # PUT /candlepin/entitlements/product/{product_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EntitlementResource.regenerateEntitlementCertificatesForProduct'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 202 ]
    QueryParams		= [
			    'lazy_regen',
			  ]
    QueryMap		= QueryMap.merge({
					   'lazy_regen' => 'lazy_regen',
					 })
    attr_accessor(:lazy_regen)

    def rqtype
      return :regenerateEntitlementCertificatesForProduct
    end

  end  # REST entrypoint class RegenerateEntitlementCertificatesForProduct

  #
  # REST endpoint definition
  #
  class Endpoint_Environments_by_Env_Id < Endpoint

    URI_Regex_String	= '^environments/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'env_id',
			  ]
    attr_accessor(:env_id)
    PathMap		= PathMap.merge({
					  'env_id' => 'env_id'
					})
    VerifiedParams	= [
			   'env_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Environments_by_Env_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Environments_by_Env_Id
  #
  class DeleteEnvEnvironment < Endpoint_Environments_by_Env_Id
    #
    # DELETE /candlepin/environments/{env_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EnvironmentResource.deleteEnv'

    #
    #  WARNING: this will delete all consumers in the environment and revoke their
    # entitlement certificates.
    #

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :deleteEnvEnvironment
    end

  end  # REST entrypoint class DeleteEnvEnvironment

  class GetEnvEnvironment < Endpoint_Environments_by_Env_Id
    #
    # GET /candlepin/environments/{env_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EnvironmentResource.getEnv'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 404 ]

    def rqtype
      return :getEnvEnvironment
    end

  end  # REST entrypoint class GetEnvEnvironment

  #
  # REST endpoint definition
  #
  class Endpoint_Environments_by_Env_Id_Consumers < Endpoint

    URI_Regex_String	= '^environments/([^/]+)/consumers/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'env_id',
			  ]
    attr_accessor(:env_id)
    PathMap		= PathMap.merge({
					  'env_id' => 'env_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Environments_by_Env_Id_Consumers

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Environments_by_Env_Id_Consumers
  #
  class CreateEnvironment < Endpoint_Environments_by_Env_Id_Consumers
    #
    # POST /candlepin/environments/{env_id}/consumers
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EnvironmentResource.create'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]
    QueryParams		= [
			    'username',
			    'owner',
			    'activation_keys',
			  ]
    QueryMap		= QueryMap.merge({
					   'activation_keys' => 'activation_keys',
					   'owner' => 'org_id',
					   'username' => 'username',
					 })
    attr_accessor(:username)
    attr_accessor(:owner)
    attr_accessor(:activation_keys)

    def rqtype
      return :createEnvironment
    end

  end  # REST entrypoint class CreateEnvironment

  #
  # REST endpoint definition
  #
  class Endpoint_Environments_by_Env_Id_Content < Endpoint

    URI_Regex_String	= '^environments/([^/]+)/content/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'env_id',
			  ]
    attr_accessor(:env_id)
    PathMap		= PathMap.merge({
					  'env_id' => 'env_id'
					})
    VerifiedParams	= [
			   'env_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Environments_by_Env_Id_Content

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Environments_by_Env_Id_Content
  #
  class DemoteContentEnvironment < Endpoint_Environments_by_Env_Id_Content
    #
    # DELETE /candlepin/environments/{env_id}/content
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EnvironmentResource.demoteContent'

    #
    #  Consumer's registered to this environment will no see this content in their
    # entitlement certificates. (after they are regenerated and synced to clients)
    #

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 404 ]
    QueryParams		= [
			    'content',
			    'lazy_regen',
			  ]
    QueryMap		= QueryMap.merge({
					   'content' => 'content',
					   'lazy_regen' => 'lazy_regen',
					 })
    attr_accessor(:content)
    attr_accessor(:lazy_regen)

    def rqtype
      return :demoteContentEnvironment
    end

  end  # REST entrypoint class DemoteContentEnvironment

  class PromoteContentEnvironment < Endpoint_Environments_by_Env_Id_Content
    #
    # POST /candlepin/environments/{env_id}/content
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EnvironmentResource.promoteContent'

    #
    #  This call accepts multiple content sets to promote at once, after which
    # all affected certificates for consumers in the enironment will be
    # regenerated.
    #

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 404 ]
    QueryParams		= [
			    'lazy_regen',
			  ]
    QueryMap		= QueryMap.merge({
					   'lazy_regen' => 'lazy_regen',
					 })
    attr_accessor(:lazy_regen)

    def rqtype
      return :promoteContentEnvironment
    end

  end  # REST entrypoint class PromoteContentEnvironment

  #
  # REST endpoint definition
  #
  class Endpoint_Environments < Endpoint

    URI_Regex_String	= '^environments/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Environments

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Environments
  #
  class GetEnvironments < Endpoint_Environments
    #
    # GET /candlepin/environments
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EnvironmentResource.getEnvironments'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getEnvironments
    end

  end  # REST entrypoint class GetEnvironments

  #
  # REST endpoint definition
  #
  class Endpoint_Events_by_Event_Id < Endpoint

    URI_Regex_String	= '^events/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'uuid',
			  ]
    attr_accessor(:event_id)
    alias_method(:uuid, :event_id)
    alias_method(:uuid=, :event_id=)
    PathMap		= PathMap.merge({
					  'uuid' => 'event_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Events_by_Event_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Events_by_Event_Id
  #
  class GetEvent < Endpoint_Events_by_Event_Id
    #
    # GET /candlepin/events/{uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EventResource.getEvent'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getEvent
    end

  end  # REST entrypoint class GetEvent

  #
  # REST endpoint definition
  #
  class Endpoint_Events < Endpoint

    URI_Regex_String	= '^events/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Events

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Events
  #
  class ListEvents < Endpoint_Events
    #
    # GET /candlepin/events
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.EventResource.listEvents'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :listEvents
    end

  end  # REST entrypoint class ListEvents

  #
  # REST endpoint definition
  #
  class Endpoint_Hypervisors < Endpoint

    URI_Regex_String	= '^hypervisors/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Hypervisors

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Hypervisors
  #
  class HypervisorCheckIn < Endpoint_Hypervisors
    #
    # POST /candlepin/hypervisors
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.HypervisorResource.hypervisorCheckIn'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 202, 200 ]
    QueryParams		= [
			    'owner',
			  ]
    QueryMap		= QueryMap.merge({
					   'owner' => 'org_id',
					 })
    attr_accessor(:owner)

    def rqtype
      return :hypervisorCheckIn
    end

  end  # REST entrypoint class HypervisorCheckIn

  #
  # REST endpoint definition
  #
  class Endpoint_Jobs_by_Job_Id < Endpoint

    URI_Regex_String	= '^jobs/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'job_id',
			  ]
    attr_accessor(:job_id)
    PathMap		= PathMap.merge({
					  'job_id' => 'job_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Jobs_by_Job_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Jobs_by_Job_Id
  #
  class CancelJob < Endpoint_Jobs_by_Job_Id
    #
    # DELETE /candlepin/jobs/{job_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.JobResource.cancel'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]

    def rqtype
      return :cancelJob
    end

  end  # REST entrypoint class CancelJob

  class GetStatusJob < Endpoint_Jobs_by_Job_Id
    #
    # GET /candlepin/jobs/{job_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.JobResource.getStatus'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getStatusJob
    end

  end  # REST entrypoint class GetStatusJob

  class GetStatusAndDeleteIfFinishedJob < Endpoint_Jobs_by_Job_Id
    #
    # POST /candlepin/jobs/{job_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.JobResource.getStatusAndDeleteIfFinished'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getStatusAndDeleteIfFinishedJob
    end

  end  # REST entrypoint class GetStatusAndDeleteIfFinishedJob

  #
  # REST endpoint definition
  #
  class Endpoint_Jobs < Endpoint

    URI_Regex_String	= '^jobs/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Jobs

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Jobs
  #
  class GetStatusesJob < Endpoint_Jobs
    #
    # GET /candlepin/jobs
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.JobResource.getStatuses'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'owner',
			    'consumer',
			    'principal',
			  ]
    QueryMap		= QueryMap.merge({
					   'consumer' => 'consumer_uuid',
					   'owner' => 'org_id',
					   'principal' => 'principal',
					 })
    attr_accessor(:owner)
    attr_accessor(:consumer)
    attr_accessor(:principal)

    def rqtype
      return :getStatusesJob
    end

  end  # REST entrypoint class GetStatusesJob

  #
  # REST endpoint definition
  #
  class Endpoint_Jobs_Scheduler < Endpoint

    URI_Regex_String	= '^jobs/scheduler/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Jobs_Scheduler

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Jobs_Scheduler
  #
  class GetSchedulerStatusJob < Endpoint_Jobs_Scheduler
    #
    # GET /candlepin/jobs/scheduler
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.JobResource.getSchedulerStatus'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getSchedulerStatusJob
    end

  end  # REST entrypoint class GetSchedulerStatusJob

  class SetSchedulerStatusJob < Endpoint_Jobs_Scheduler
    #
    # POST /candlepin/jobs/scheduler
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.JobResource.setSchedulerStatus'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 500, 200 ]

    def rqtype
      return :setSchedulerStatusJob
    end

  end  # REST entrypoint class SetSchedulerStatusJob

  #
  # REST endpoint definition
  #
  class Endpoint_Migrations < Endpoint

    URI_Regex_String	= '^migrations/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Migrations

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Migrations
  #
  class CreateMigration < Endpoint_Migrations
    #
    # POST /candlepin/migrations
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.MigrationResource.createMigration'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 202 ]
    QueryParams		= [
			    'entity',
			    'id',
			    'uri',
			    'delete',
			  ]
    QueryMap		= QueryMap.merge({
					   'delete' => 'delete',
					   'entity' => 'entity',
					   'id' => 'id',
					   'uri' => 'uri',
					 })
    attr_accessor(:entity)
    attr_accessor(:id)
    attr_accessor(:uri)
    attr_accessor(:delete)

    def rqtype
      return :createMigration
    end

  end  # REST entrypoint class CreateMigration

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id
  #
  class DeleteOwner < Endpoint_Owners_by_Org_Id
    #
    # DELETE /candlepin/owners/{owner_key}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.deleteOwner'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]
    QueryParams		= [
			    'revoke',
			  ]
    QueryMap		= QueryMap.merge({
					   'revoke' => 'revoke',
					 })
    attr_accessor(:revoke)

    def rqtype
      return :deleteOwner
    end

  end  # REST entrypoint class DeleteOwner

  class GetOwner < Endpoint_Owners_by_Org_Id
    #
    # GET /candlepin/owners/{owner_key}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getOwner'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getOwner
    end

  end  # REST entrypoint class GetOwner

  class UpdateOwner < Endpoint_Owners_by_Org_Id
    #
    # PUT /candlepin/owners/{owner_key}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.updateOwner'

    #
    #  To un-set the defaultServiceLevel for an owner, submit an empty string.
    #

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :updateOwner
    end

  end  # REST entrypoint class UpdateOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Activation_Keys < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/activation_keys/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Activation_Keys

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Activation_Keys
  #
  class CreateActivationKeyOwner < Endpoint_Owners_by_Org_Id_Activation_Keys
    #
    # POST /candlepin/owners/{owner_key}/activation_keys
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.createActivationKey'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]

    def rqtype
      return :createActivationKeyOwner
    end

  end  # REST entrypoint class CreateActivationKeyOwner

  class OwnerActivationKeys < Endpoint_Owners_by_Org_Id_Activation_Keys
    #
    # GET /candlepin/owners/{owner_key}/activation_keys
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.ownerActivationKeys'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :ownerActivationKeys
    end

  end  # REST entrypoint class OwnerActivationKeys

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Atom < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/atom/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Atom

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Atom
  #
  class GetOwnerAtomFeed < Endpoint_Owners_by_Org_Id_Atom
    #
    # GET /candlepin/owners/{owner_key}/atom
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getOwnerAtomFeed'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getOwnerAtomFeed
    end

  end  # REST entrypoint class GetOwnerAtomFeed

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Consumers_by_Consumer_Uuid_Atom < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/consumers/([^/]+)/atom/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			   'consumer_uuid',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    attr_accessor(:consumer_uuid)
    PathMap		= PathMap.merge({
					  'consumer_uuid' => 'consumer_uuid',
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Consumers_by_Consumer_Uuid_Atom

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Consumers_by_Consumer_Uuid_Atom
  #
  class GetConsumerAtomFeedOwner < Endpoint_Owners_by_Org_Id_Consumers_by_Consumer_Uuid_Atom
    #
    # GET /candlepin/owners/{owner_key}/consumers/{consumer_uuid}/atom
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getConsumerAtomFeed'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getConsumerAtomFeedOwner
    end

  end  # REST entrypoint class GetConsumerAtomFeedOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Consumers < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/consumers/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Consumers

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Consumers
  #
  class OwnerConsumers < Endpoint_Owners_by_Org_Id_Consumers
    #
    # GET /candlepin/owners/{owner_key}/consumers
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.ownerConsumers'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'username',
			    'type',
			    'uuid',
			  ]
    QueryMap		= QueryMap.merge({
					   'type' => 'type',
					   'username' => 'username',
					   'uuid' => 'uuid',
					 })
    attr_accessor(:username)
    attr_accessor(:type)
    attr_accessor(:uuid)

    def rqtype
      return :ownerConsumers
    end

  end  # REST entrypoint class OwnerConsumers

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Entitlements < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/entitlements/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Entitlements

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Entitlements
  #
  class HealEntireOwner < Endpoint_Owners_by_Org_Id_Entitlements
    #
    # POST /candlepin/owners/{owner_key}/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.healEntire'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 202 ]

    def rqtype
      return :healEntireOwner
    end

  end  # REST entrypoint class HealEntireOwner

  class OwnerEntitlements < Endpoint_Owners_by_Org_Id_Entitlements
    #
    # GET /candlepin/owners/{owner_key}/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.ownerEntitlements'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :ownerEntitlements
    end

  end  # REST entrypoint class OwnerEntitlements

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Environments < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/environments/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Environments

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Environments
  #
  class CreateEnvOwner < Endpoint_Owners_by_Org_Id_Environments
    #
    # POST /candlepin/owners/{owner_key}/environments
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.createEnv'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :createEnvOwner
    end

  end  # REST entrypoint class CreateEnvOwner

  class ListEnvironmentsOwner < Endpoint_Owners_by_Org_Id_Environments
    #
    # GET /candlepin/owners/{owner_key}/environments
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.listEnvironments'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]
    QueryParams		= [
			    'name',
			  ]
    QueryMap		= QueryMap.merge({
					   'name' => 'name',
					 })
    attr_accessor(:name)

    def rqtype
      return :listEnvironmentsOwner
    end

  end  # REST entrypoint class ListEnvironmentsOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Events < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/events/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Events

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Events
  #
  class GetEventsOwner < Endpoint_Owners_by_Org_Id_Events
    #
    # GET /candlepin/owners/{owner_key}/events
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getEvents'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getEventsOwner
    end

  end  # REST entrypoint class GetEventsOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Imports < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/imports/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Imports

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Imports
  #
  class GetImportsOwner < Endpoint_Owners_by_Org_Id_Imports
    #
    # GET /candlepin/owners/{owner_key}/imports
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getImports'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getImportsOwner
    end

  end  # REST entrypoint class GetImportsOwner

  class ImportManifestOwner < Endpoint_Owners_by_Org_Id_Imports
    #
    # POST /candlepin/owners/{owner_key}/imports
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.importManifest'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 500, 200, 409 ]
    QueryParams		= [
			    'force',
			  ]
    QueryMap		= QueryMap.merge({
					   'force' => 'force',
					 })
    attr_accessor(:force)

    def rqtype
      return :importManifestOwner
    end

  end  # REST entrypoint class ImportManifestOwner

  class UndoImportsOwner < Endpoint_Owners_by_Org_Id_Imports
    #
    # DELETE /candlepin/owners/{owner_key}/imports
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.undoImports'

    #
    #  This call does not differentiate between any specific import, it just
    # destroys all subscriptions with an upstream pool ID, essentially anything from
    # an import. Custom subscriptions will be left alone.
    #

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :undoImportsOwner
    end

  end  # REST entrypoint class UndoImportsOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Info < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/info/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Info

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Info
  #
  class GetOwnerInfo < Endpoint_Owners_by_Org_Id_Info
    #
    # GET /candlepin/owners/{owner_key}/info
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getOwnerInfo'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getOwnerInfo
    end

  end  # REST entrypoint class GetOwnerInfo

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Pools < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/pools/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Pools

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Pools
  #
  class GetPoolsOwner < Endpoint_Owners_by_Org_Id_Pools
    #
    # GET /candlepin/owners/{owner_key}/pools
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getPools'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'consumer',
			    'product',
			    'listall',
			    'activeon',
			  ]
    QueryMap		= QueryMap.merge({
					   'activeon' => 'activeon',
					   'consumer' => 'consumer_uuid',
					   'listall' => 'listall',
					   'product' => 'product_id',
					 })
    attr_accessor(:consumer)
    attr_accessor(:product)
    attr_accessor(:listall)
    attr_accessor(:activeon)

    def rqtype
      return :getPoolsOwner
    end

  end  # REST entrypoint class GetPoolsOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Servicelevels < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/servicelevels/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Servicelevels

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Servicelevels
  #
  class OwnerServiceLevels < Endpoint_Owners_by_Org_Id_Servicelevels
    #
    # GET /candlepin/owners/{owner_key}/servicelevels
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.ownerServiceLevels'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :ownerServiceLevels
    end

  end  # REST entrypoint class OwnerServiceLevels

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Statistics_by_Type < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/statistics/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			   'type',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    attr_accessor(:type)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id',
					  'type' => 'type'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Statistics_by_Type

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Statistics_by_Type
  #
  class GetStatisticsOwner < Endpoint_Owners_by_Org_Id_Statistics_by_Type
    #
    # GET /candlepin/owners/{owner_key}/statistics/{type}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getStatistics'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]
    QueryParams		= [
			    'reference',
			    'from',
			    'to',
			    'days',
			  ]
    QueryMap		= QueryMap.merge({
					   'days' => 'days',
					   'from' => 'from',
					   'reference' => 'reference',
					   'to' => 'to',
					 })
    attr_accessor(:reference)
    attr_accessor(:from)
    attr_accessor(:to)
    attr_accessor(:days)

    def rqtype
      return :getStatisticsOwner
    end

  end  # REST entrypoint class GetStatisticsOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Subscriptions < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/subscriptions/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Subscriptions

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Subscriptions
  #
  class CreateSubscriptionOwner < Endpoint_Owners_by_Org_Id_Subscriptions
    #
    # POST /candlepin/owners/{owner_key}/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.createSubscription'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :createSubscriptionOwner
    end

  end  # REST entrypoint class CreateSubscriptionOwner

  class GetSubscriptionsOwner < Endpoint_Owners_by_Org_Id_Subscriptions
    #
    # GET /candlepin/owners/{owner_key}/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getSubscriptions'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getSubscriptionsOwner
    end

  end  # REST entrypoint class GetSubscriptionsOwner

  class RefreshPoolsOwner < Endpoint_Owners_by_Org_Id_Subscriptions
    #
    # PUT /candlepin/owners/{owner_key}/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.refreshPools'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    API_Flags		= API_Flags.merge({
				  :can_create_owner => true
				})
    HTTPStatusCodes	= [ 404, 202 ]
    QueryParams		= [
			    'auto_create_owner',
			    'lazy_regen',
			  ]
    QueryMap		= QueryMap.merge({
					   'auto_create_owner' => 'auto_create_owner',
					   'lazy_regen' => 'lazy_regen',
					 })
    attr_accessor(:auto_create_owner)
    attr_accessor(:lazy_regen)

    def rqtype
      return :refreshPoolsOwner
    end

  end  # REST entrypoint class RefreshPoolsOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Uebercert < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/uebercert/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Uebercert

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Uebercert
  #
  class CreateUeberCertificateOwner < Endpoint_Owners_by_Org_Id_Uebercert
    #
    # POST /candlepin/owners/{owner_key}/uebercert
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.createUeberCertificate'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]

    def rqtype
      return :createUeberCertificateOwner
    end

  end  # REST entrypoint class CreateUeberCertificateOwner

  class GetUeberCertificateOwner < Endpoint_Owners_by_Org_Id_Uebercert
    #
    # GET /candlepin/owners/{owner_key}/uebercert
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getUeberCertificate'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getUeberCertificateOwner
    end

  end  # REST entrypoint class GetUeberCertificateOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_by_Org_Id_Upstream_Consumers < Endpoint

    URI_Regex_String	= '^owners/([^/]+)/upstream_consumers/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'owner_key',
			  ]
    attr_accessor(:org_id)
    alias_method(:owner_key, :org_id)
    alias_method(:owner_key=, :org_id=)
    PathMap		= PathMap.merge({
					  'owner_key' => 'org_id'
					})
    VerifiedParams	= [
			   'org_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_by_Org_Id_Upstream_Consumers

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_by_Org_Id_Upstream_Consumers
  #
  class GetUpstreamConsumersOwner < Endpoint_Owners_by_Org_Id_Upstream_Consumers
    #
    # GET /candlepin/owners/{owner_key}/upstream_consumers
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.getUpstreamConsumers'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getUpstreamConsumersOwner
    end

  end  # REST entrypoint class GetUpstreamConsumersOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners < Endpoint

    URI_Regex_String	= '^owners/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners
  #
  class CreateOwner < Endpoint_Owners
    #
    # POST /candlepin/owners
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.createOwner'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :createOwner
    end

  end  # REST entrypoint class CreateOwner

  class ListOwner < Endpoint_Owners
    #
    # GET /candlepin/owners
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]
    QueryParams		= [
			    'key',
			  ]
    QueryMap		= QueryMap.merge({
					   'key' => 'org_id',
					 })
    attr_accessor(:key)

    def rqtype
      return :listOwner
    end

  end  # REST entrypoint class ListOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Owners_Subscriptions < Endpoint

    URI_Regex_String	= '^owners/subscriptions/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Owners_Subscriptions

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Owners_Subscriptions
  #
  class UpdateSubscriptionOwner < Endpoint_Owners_Subscriptions
    #
    # PUT /candlepin/owners/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.OwnerResource.updateSubscription'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :updateSubscriptionOwner
    end

  end  # REST entrypoint class UpdateSubscriptionOwner

  #
  # REST endpoint definition
  #
  class Endpoint_Pools_by_Pool_Id < Endpoint

    URI_Regex_String	= '^pools/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'pool_id',
			  ]
    attr_accessor(:pool_id)
    PathMap		= PathMap.merge({
					  'pool_id' => 'pool_id'
					})
    VerifiedParams	= [
			   'pool_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Pools_by_Pool_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Pools_by_Pool_Id
  #
  class DeletePool < Endpoint_Pools_by_Pool_Id
    #
    # DELETE /candlepin/pools/{pool_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.PoolResource.deletePool'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 404 ]

    def rqtype
      return :deletePool
    end

  end  # REST entrypoint class DeletePool

  class GetPool < Endpoint_Pools_by_Pool_Id
    #
    # GET /candlepin/pools/{pool_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.PoolResource.getPool'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 404, 404 ]
    QueryParams		= [
			    'consumer',
			    'activeon',
			  ]
    QueryMap		= QueryMap.merge({
					   'activeon' => 'activeon',
					   'consumer' => 'consumer_uuid',
					 })
    attr_accessor(:consumer)
    attr_accessor(:activeon)

    def rqtype
      return :getPool
    end

  end  # REST entrypoint class GetPool

  #
  # REST endpoint definition
  #
  class Endpoint_Pools_by_Pool_Id_Entitlements < Endpoint

    URI_Regex_String	= '^pools/([^/]+)/entitlements/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'pool_id',
			  ]
    attr_accessor(:pool_id)
    PathMap		= PathMap.merge({
					  'pool_id' => 'pool_id'
					})
    VerifiedParams	= [
			   'pool_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Pools_by_Pool_Id_Entitlements

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Pools_by_Pool_Id_Entitlements
  #
  class GetPoolEntitlements < Endpoint_Pools_by_Pool_Id_Entitlements
    #
    # GET /candlepin/pools/{pool_id}/entitlements
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.PoolResource.getPoolEntitlements'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :getPoolEntitlements
    end

  end  # REST entrypoint class GetPoolEntitlements

  #
  # REST endpoint definition
  #
  class Endpoint_Pools_by_Pool_Id_Statistics_by_Vtype < Endpoint

    URI_Regex_String	= '^pools/([^/]+)/statistics/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'pool_id',
			   'vtype',
			  ]
    attr_accessor(:pool_id)
    attr_accessor(:vtype)
    PathMap		= PathMap.merge({
					  'pool_id' => 'pool_id',
					  'vtype' => 'vtype'
					})
    VerifiedParams	= [
			   'pool_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Pools_by_Pool_Id_Statistics_by_Vtype

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Pools_by_Pool_Id_Statistics_by_Vtype
  #
  class GetPoolStats < Endpoint_Pools_by_Pool_Id_Statistics_by_Vtype
    #
    # GET /candlepin/pools/{pool_id}/statistics/{vtype}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.PoolResource.getPoolStats'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]
    QueryParams		= [
			    'from',
			    'to',
			    'days',
			  ]
    QueryMap		= QueryMap.merge({
					   'days' => 'days',
					   'from' => 'from',
					   'to' => 'to',
					 })
    attr_accessor(:from)
    attr_accessor(:to)
    attr_accessor(:days)

    def rqtype
      return :getPoolStats
    end

  end  # REST entrypoint class GetPoolStats

  #
  # REST endpoint definition
  #
  class Endpoint_Pools < Endpoint

    URI_Regex_String	= '^pools/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Pools

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Pools
  #
  class ListPool < Endpoint_Pools
    #
    # GET /candlepin/pools
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.PoolResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 400, 404, 403 ]
    QueryParams		= [
			    'owner',
			    'consumer',
			    'product',
			    'listall',
			    'activeon',
			  ]
    QueryMap		= QueryMap.merge({
					   'activeon' => 'activeon',
					   'consumer' => 'consumer_uuid',
					   'listall' => 'listall',
					   'owner' => 'owner_id',
					   'product' => 'product_id',
					 })
    attr_accessor(:owner)
    attr_accessor(:consumer)
    attr_accessor(:product)
    attr_accessor(:listall)
    attr_accessor(:activeon)

    def rqtype
      return :listPool
    end

  end  # REST entrypoint class ListPool

  #
  # REST endpoint definition
  #
  class Endpoint_Products_by_Product_Id < Endpoint

    URI_Regex_String	= '^products/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'product_uuid',
			  ]
    attr_accessor(:product_id)
    alias_method(:product_uuid, :product_id)
    alias_method(:product_uuid=, :product_id=)
    PathMap		= PathMap.merge({
					  'product_uuid' => 'product_id'
					})
    VerifiedParams	= [
			   'product_id',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_by_Product_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_by_Product_Id
  #
  class DeleteProduct < Endpoint_Products_by_Product_Id
    #
    # DELETE /candlepin/products/{product_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.deleteProduct'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 404, 200 ]

    def rqtype
      return :deleteProduct
    end

  end  # REST entrypoint class DeleteProduct

  class GetProduct < Endpoint_Products_by_Product_Id
    #
    # GET /candlepin/products/{product_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.getProduct'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getProduct
    end

  end  # REST entrypoint class GetProduct

  class UpdateProduct < Endpoint_Products_by_Product_Id
    #
    # PUT /candlepin/products/{product_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.updateProduct'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :updateProduct
    end

  end  # REST entrypoint class UpdateProduct

  #
  # REST endpoint definition
  #
  class Endpoint_Products_by_Product_Id_Certificate < Endpoint

    URI_Regex_String	= '^products/([^/]+)/certificate/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'product_uuid',
			  ]
    attr_accessor(:product_id)
    alias_method(:product_uuid, :product_id)
    alias_method(:product_uuid=, :product_id=)
    PathMap		= PathMap.merge({
					  'product_uuid' => 'product_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_by_Product_Id_Certificate

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_by_Product_Id_Certificate
  #
  class GetProductCertificate < Endpoint_Products_by_Product_Id_Certificate
    #
    # GET /candlepin/products/{product_uuid}/certificate
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.getProductCertificate'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :getProductCertificate
    end

  end  # REST entrypoint class GetProductCertificate

  #
  # REST endpoint definition
  #
  class Endpoint_Products_by_Product_Id_Content_by_Content_Id < Endpoint

    URI_Regex_String	= '^products/([^/]+)/content/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'product_uuid',
			   'content_id',
			  ]
    attr_accessor(:product_id)
    alias_method(:product_uuid, :product_id)
    alias_method(:product_uuid=, :product_id=)
    attr_accessor(:content_id)
    PathMap		= PathMap.merge({
					  'content_id' => 'content_id',
					  'product_uuid' => 'product_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_by_Product_Id_Content_by_Content_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_by_Product_Id_Content_by_Content_Id
  #
  class AddContentProduct < Endpoint_Products_by_Product_Id_Content_by_Content_Id
    #
    # POST /candlepin/products/{product_uuid}/content/{content_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.addContent'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]
    QueryParams		= [
			    'enabled',
			  ]
    QueryMap		= QueryMap.merge({
					   'enabled' => 'enabled',
					 })
    attr_accessor(:enabled)

    def rqtype
      return :addContentProduct
    end

  end  # REST entrypoint class AddContentProduct

  class RemoveContentProduct < Endpoint_Products_by_Product_Id_Content_by_Content_Id
    #
    # DELETE /candlepin/products/{product_uuid}/content/{content_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.removeContent'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :removeContentProduct
    end

  end  # REST entrypoint class RemoveContentProduct

  #
  # REST endpoint definition
  #
  class Endpoint_Products_by_Product_Id_Reliance_by_Rely_Product_Id < Endpoint

    URI_Regex_String	= '^products/([^/]+)/reliance/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'product_uuid',
			   'rely_product_id',
			   'rely_product_uuid',
			  ]
    attr_accessor(:product_id)
    alias_method(:product_uuid, :product_id)
    alias_method(:product_uuid=, :product_id=)
    attr_accessor(:rely_product_id)
    attr_accessor(:rely_product_uuid)
    PathMap		= PathMap.merge({
					  'product_uuid' => 'product_id',
					  'rely_product_id' => 'rely_product_id',
					  'rely_product_uuid' => 'rely_product_uuid'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_by_Product_Id_Reliance_by_Rely_Product_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_by_Product_Id_Reliance_by_Rely_Product_Id
  #
  class AddRelianceProduct < Endpoint_Products_by_Product_Id_Reliance_by_Rely_Product_Id
    #
    # POST /candlepin/products/{product_uuid}/reliance/{rely_product_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.addReliance'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :addRelianceProduct
    end

  end  # REST entrypoint class AddRelianceProduct

  class RemoveRelianceProduct < Endpoint_Products_by_Product_Id_Reliance_by_Rely_Product_Id
    #
    # DELETE /candlepin/products/{product_uuid}/reliance/{rely_product_uuid}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.removeReliance'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :removeRelianceProduct
    end

  end  # REST entrypoint class RemoveRelianceProduct

  #
  # REST endpoint definition
  #
  class Endpoint_Products_by_Prod_Id_Statistics_by_Vtype < Endpoint

    URI_Regex_String	= '^products/([^/]+)/statistics/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'prod_id',
			   'vtype',
			  ]
    attr_accessor(:prod_id)
    attr_accessor(:vtype)
    PathMap		= PathMap.merge({
					  'prod_id' => 'prod_id',
					  'vtype' => 'vtype'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_by_Prod_Id_Statistics_by_Vtype

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_by_Prod_Id_Statistics_by_Vtype
  #
  class GetProductStats < Endpoint_Products_by_Prod_Id_Statistics_by_Vtype
    #
    # GET /candlepin/products/{prod_id}/statistics/{vtype}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.getProductStats'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]
    QueryParams		= [
			    'from',
			    'to',
			    'days',
			  ]
    QueryMap		= QueryMap.merge({
					   'days' => 'days',
					   'from' => 'from',
					   'to' => 'to',
					 })
    attr_accessor(:from)
    attr_accessor(:to)
    attr_accessor(:days)

    def rqtype
      return :getProductStats
    end

  end  # REST entrypoint class GetProductStats

  #
  # REST endpoint definition
  #
  class Endpoint_Products_by_Product_Id_Subscriptions < Endpoint

    URI_Regex_String	= '^products/([^/]+)/subscriptions/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'product_uuid',
			  ]
    attr_accessor(:product_id)
    alias_method(:product_uuid, :product_id)
    alias_method(:product_uuid=, :product_id=)
    PathMap		= PathMap.merge({
					  'product_uuid' => 'product_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_by_Product_Id_Subscriptions

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_by_Product_Id_Subscriptions
  #
  class RefreshPoolsForProduct < Endpoint_Products_by_Product_Id_Subscriptions
    #
    # PUT /candlepin/products/{product_uuid}/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.refreshPoolsForProduct'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]
    QueryParams		= [
			    'lazy_regen',
			  ]
    QueryMap		= QueryMap.merge({
					   'lazy_regen' => 'lazy_regen',
					 })
    attr_accessor(:lazy_regen)

    def rqtype
      return :refreshPoolsForProduct
    end

  end  # REST entrypoint class RefreshPoolsForProduct

  #
  # REST endpoint definition
  #
  class Endpoint_Products < Endpoint

    URI_Regex_String	= '^products/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products
  #
  class CreateProduct < Endpoint_Products
    #
    # POST /candlepin/products
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.createProduct'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :createProduct
    end

  end  # REST entrypoint class CreateProduct

  class ListProduct < Endpoint_Products
    #
    # GET /candlepin/products
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :listProduct
    end

  end  # REST entrypoint class ListProduct

  #
  # REST endpoint definition
  #
  class Endpoint_Products_Owners < Endpoint

    URI_Regex_String	= '^products/owners/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Products_Owners

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Products_Owners
  #
  class GetActiveProductOwners < Endpoint_Products_Owners
    #
    # GET /candlepin/products/owners
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.ProductResource.getActiveProductOwners'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200, 400 ]
    QueryParams		= [
			    'product',
			  ]
    QueryMap		= QueryMap.merge({
					   'product' => 'product_id',
					 })
    attr_accessor(:product)

    def rqtype
      return :getActiveProductOwners
    end

  end  # REST entrypoint class GetActiveProductOwners

  #
  # REST endpoint definition
  #
  class Endpoint_Roles_by_Role_Id < Endpoint

    URI_Regex_String	= '^roles/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'role_id',
			  ]
    attr_accessor(:role_id)
    PathMap		= PathMap.merge({
					  'role_id' => 'role_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Roles_by_Role_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Roles_by_Role_Id
  #
  class DeleteRole < Endpoint_Roles_by_Role_Id
    #
    # DELETE /candlepin/roles/{role_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.deleteRole'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :deleteRole
    end

  end  # REST entrypoint class DeleteRole

  class GetRole < Endpoint_Roles_by_Role_Id
    #
    # GET /candlepin/roles/{role_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.getRole'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getRole
    end

  end  # REST entrypoint class GetRole

  class UpdateRole < Endpoint_Roles_by_Role_Id
    #
    # PUT /candlepin/roles/{role_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.updateRole'

    #
    #  To avoid race conditions, we do not support updating the user or permission
    # collections. Currently this call will only update the role name.
    #

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :updateRole
    end

  end  # REST entrypoint class UpdateRole

  #
  # REST endpoint definition
  #
  class Endpoint_Roles_by_Role_Id_Permissions_by_Perm_Id < Endpoint

    URI_Regex_String	= '^roles/([^/]+)/permissions/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'role_id',
			   'perm_id',
			  ]
    attr_accessor(:role_id)
    attr_accessor(:perm_id)
    PathMap		= PathMap.merge({
					  'perm_id' => 'perm_id',
					  'role_id' => 'role_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Roles_by_Role_Id_Permissions_by_Perm_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Roles_by_Role_Id_Permissions_by_Perm_Id
  #
  class RemoveRolePermission < Endpoint_Roles_by_Role_Id_Permissions_by_Perm_Id
    #
    # DELETE /candlepin/roles/{role_id}/permissions/{perm_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.removeRolePermission'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :removeRolePermission
    end

  end  # REST entrypoint class RemoveRolePermission

  #
  # REST endpoint definition
  #
  class Endpoint_Roles_by_Role_Id_Permissions < Endpoint

    URI_Regex_String	= '^roles/([^/]+)/permissions/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'role_id',
			  ]
    attr_accessor(:role_id)
    PathMap		= PathMap.merge({
					  'role_id' => 'role_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Roles_by_Role_Id_Permissions

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Roles_by_Role_Id_Permissions
  #
  class AddRolePermission < Endpoint_Roles_by_Role_Id_Permissions
    #
    # POST /candlepin/roles/{role_id}/permissions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.addRolePermission'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 400, 200 ]

    def rqtype
      return :addRolePermission
    end

  end  # REST entrypoint class AddRolePermission

  #
  # REST endpoint definition
  #
  class Endpoint_Roles_by_Role_Id_Users_by_Username < Endpoint

    URI_Regex_String	= '^roles/([^/]+)/users/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'role_id',
			   'username',
			  ]
    attr_accessor(:role_id)
    attr_accessor(:username)
    PathMap		= PathMap.merge({
					  'role_id' => 'role_id',
					  'username' => 'username'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Roles_by_Role_Id_Users_by_Username

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Roles_by_Role_Id_Users_by_Username
  #
  class AddUserRole < Endpoint_Roles_by_Role_Id_Users_by_Username
    #
    # POST /candlepin/roles/{role_id}/users/{username}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.addUser'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :addUserRole
    end

  end  # REST entrypoint class AddUserRole

  class DeleteUserRole < Endpoint_Roles_by_Role_Id_Users_by_Username
    #
    # DELETE /candlepin/roles/{role_id}/users/{username}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.deleteUser'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404 ]

    def rqtype
      return :deleteUserRole
    end

  end  # REST entrypoint class DeleteUserRole

  #
  # REST endpoint definition
  #
  class Endpoint_Roles < Endpoint

    URI_Regex_String	= '^roles/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Roles

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Roles
  #
  class CreateRole < Endpoint_Roles
    #
    # POST /candlepin/roles
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.createRole'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :createRole
    end

  end  # REST entrypoint class CreateRole

  class GetRoles < Endpoint_Roles
    #
    # GET /candlepin/roles
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RoleResource.getRoles'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getRoles
    end

  end  # REST entrypoint class GetRoles

  #
  # REST endpoint definition
  #
  class Endpoint_Rules < Endpoint

    URI_Regex_String	= '^rules/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Rules

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Rules
  #
  class DeleteRules < Endpoint_Rules
    #
    # DELETE /candlepin/rules
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RulesResource.delete'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :deleteRules
    end

  end  # REST entrypoint class DeleteRules

  class GetRules < Endpoint_Rules
    #
    # GET /candlepin/rules
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RulesResource.get'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 503, 200 ]

    def rqtype
      return :getRules
    end

  end  # REST entrypoint class GetRules

  class UploadRules < Endpoint_Rules
    #
    # POST /candlepin/rules
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.RulesResource.upload'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :uploadRules
    end

  end  # REST entrypoint class UploadRules

  #
  # REST endpoint definition
  #
  class Endpoint_Serials_by_Serial_Id < Endpoint

    URI_Regex_String	= '^serials/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'serial_id',
			  ]
    attr_accessor(:serial_id)
    PathMap		= PathMap.merge({
					  'serial_id' => 'serial_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Serials_by_Serial_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Serials_by_Serial_Id
  #
  class GetCertificateSerial < Endpoint_Serials_by_Serial_Id
    #
    # GET /candlepin/serials/{serial_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.CertificateSerialResource.getCertificateSerial'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getCertificateSerial
    end

  end  # REST entrypoint class GetCertificateSerial

  #
  # REST endpoint definition
  #
  class Endpoint_Serials < Endpoint

    URI_Regex_String	= '^serials/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Serials

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Serials
  #
  class GetCertificateSerials < Endpoint_Serials
    #
    # GET /candlepin/serials
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.CertificateSerialResource.getCertificateSerials'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getCertificateSerials
    end

  end  # REST entrypoint class GetCertificateSerials

  #
  # REST endpoint definition
  #
  class Endpoint_Statistics_Generate < Endpoint

    URI_Regex_String	= '^statistics/generate/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Statistics_Generate

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Statistics_Generate
  #
  class ExecuteStatistic < Endpoint_Statistics_Generate
    #
    # PUT /candlepin/statistics/generate
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.StatisticResource.execute'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 503, 200 ]

    def rqtype
      return :executeStatistic
    end

  end  # REST entrypoint class ExecuteStatistic

  #
  # REST endpoint definition
  #
  class Endpoint_Status < Endpoint

    URI_Regex_String	= '^status/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Status

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Status
  #
  class Status < Endpoint_Status
    #
    # GET /candlepin/status
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.StatusResource.status'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    API_Flags		= API_Flags.merge({
				  :admin_only => true
				})
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :status
    end

  end  # REST entrypoint class Status

  #
  # REST endpoint definition
  #
  class Endpoint_Subscriptions_by_Subscription_Id < Endpoint

    URI_Regex_String	= '^subscriptions/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'subscription_id',
			  ]
    attr_accessor(:subscription_id)
    PathMap		= PathMap.merge({
					  'subscription_id' => 'subscription_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Subscriptions_by_Subscription_Id

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Subscriptions_by_Subscription_Id
  #
  class DeleteSubscription < Endpoint_Subscriptions_by_Subscription_Id
    #
    # DELETE /candlepin/subscriptions/{subscription_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.SubscriptionResource.deleteSubscription'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :deleteSubscription
    end

  end  # REST entrypoint class DeleteSubscription

  class GetSubscription < Endpoint_Subscriptions_by_Subscription_Id
    #
    # GET /candlepin/subscriptions/{subscription_id}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.SubscriptionResource.getSubscription'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    API_Flags		= API_Flags.merge({
				  :internal_only => true
				})
    HTTPStatusCodes	= [ 400, 200 ]

    def rqtype
      return :getSubscription
    end

  end  # REST entrypoint class GetSubscription

  #
  # REST endpoint definition
  #
  class Endpoint_Subscriptions_by_Subscription_Id_Cert < Endpoint

    URI_Regex_String	= '^subscriptions/([^/]+)/cert/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'subscription_id',
			  ]
    attr_accessor(:subscription_id)
    PathMap		= PathMap.merge({
					  'subscription_id' => 'subscription_id'
					})
    VerifiedParams	= []

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Subscriptions_by_Subscription_Id_Cert

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Subscriptions_by_Subscription_Id_Cert
  #
  class GetSubCertAsPemSubscription < Endpoint_Subscriptions_by_Subscription_Id_Cert
    #
    # GET /candlepin/subscriptions/{subscription_id}/cert
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.SubscriptionResource.getSubCertAsPem'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [  ]

    def rqtype
      return :getSubCertAsPemSubscription
    end

  end  # REST entrypoint class GetSubCertAsPemSubscription

  #
  # REST endpoint definition
  #
  class Endpoint_Subscriptions < Endpoint

    URI_Regex_String	= '^subscriptions/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Subscriptions

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Subscriptions
  #
  class ActivateSubscription < Endpoint_Subscriptions
    #
    # POST /candlepin/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.SubscriptionResource.activateSubscription'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 400, 503, 200 ]
    QueryParams		= [
			    'consumer_uuid',
			    'email',
			    'email_locale',
			  ]
    QueryMap		= QueryMap.merge({
					   'consumer_uuid' => 'consumer_uuid',
					   'email' => 'email',
					   'email_locale' => 'email_locale',
					 })
    attr_accessor(:consumer_uuid)
    attr_accessor(:email)
    attr_accessor(:email_locale)

    def rqtype
      return :activateSubscription
    end

  end  # REST entrypoint class ActivateSubscription

  class GetSubscriptions < Endpoint_Subscriptions
    #
    # GET /candlepin/subscriptions
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.SubscriptionResource.getSubscriptions'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getSubscriptions
    end

  end  # REST entrypoint class GetSubscriptions

  #
  # REST endpoint definition
  #
  class Endpoint_Users_by_Username < Endpoint

    URI_Regex_String	= '^users/([^/]+)/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'username',
			  ]
    attr_accessor(:username)
    PathMap		= PathMap.merge({
					  'username' => 'username'
					})
    VerifiedParams	= [
			   'username',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Users_by_Username

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Users_by_Username
  #
  class DeleteUser < Endpoint_Users_by_Username
    #
    # DELETE /candlepin/users/{username}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.deleteUser'

    Verb		= :DELETE
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 410, 200 ]

    def rqtype
      return :deleteUser
    end

  end  # REST entrypoint class DeleteUser

  class GetUserInfo < Endpoint_Users_by_Username
    #
    # GET /candlepin/users/{username}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.getUserInfo'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getUserInfo
    end

  end  # REST entrypoint class GetUserInfo

  class UpdateUser < Endpoint_Users_by_Username
    #
    # PUT /candlepin/users/{username}
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.updateUser'

    Verb		= :PUT
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 404, 200 ]

    def rqtype
      return :updateUser
    end

  end  # REST entrypoint class UpdateUser

  #
  # REST endpoint definition
  #
  class Endpoint_Users_by_Username_Owners < Endpoint

    URI_Regex_String	= '^users/([^/]+)/owners/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'username',
			  ]
    attr_accessor(:username)
    PathMap		= PathMap.merge({
					  'username' => 'username'
					})
    VerifiedParams	= [
			   'username',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Users_by_Username_Owners

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Users_by_Username_Owners
  #
  class ListUsersOwners < Endpoint_Users_by_Username_Owners
    #
    # GET /candlepin/users/{username}/owners
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.listUsersOwners'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :listUsersOwners
    end

  end  # REST entrypoint class ListUsersOwners

  #
  # REST endpoint definition
  #
  class Endpoint_Users_by_Username_Roles < Endpoint

    URI_Regex_String	= '^users/([^/]+)/roles/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)
    PathParams		= [
			   'username',
			  ]
    attr_accessor(:username)
    PathMap		= PathMap.merge({
					  'username' => 'username'
					})
    VerifiedParams	= [
			   'username',
			  ]

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Users_by_Username_Roles

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Users_by_Username_Roles
  #
  class GetUserRoles < Endpoint_Users_by_Username_Roles
    #
    # GET /candlepin/users/{username}/roles
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.getUserRoles'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :getUserRoles
    end

  end  # REST entrypoint class GetUserRoles

  #
  # REST endpoint definition
  #
  class Endpoint_Users < Endpoint

    URI_Regex_String	= '^users/?$'
    URI_Regex		= Regexp.new(URI_Regex_String)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class Endpoint_Users

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_Users
  #
  class CreateUser < Endpoint_Users
    #
    # POST /candlepin/users
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.createUser'

    Verb		= :POST
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :createUser
    end

  end  # REST entrypoint class CreateUser

  class ListUser < Endpoint_Users
    #
    # GET /candlepin/users
    #

    include EntrypointExtensions

    API_Method_Full_Name = 'org.candlepin.resource.UserResource.list'

    Verb		= :GET
    self.endpoint.const_get('Verbs')[Verb] = self
    HTTPStatusCodes	= [ 200 ]

    def rqtype
      return :listUser
    end

  end  # REST entrypoint class ListUser

end
