#
# Command-line definitions for API defined in /home/coar/othergit/candlepin-api/data/candlepin_methods-candlepin-0.8.21-1.json.
#
require('rubygems')
require('cri')
require('optparse')
require('ostruct')

module CandlepinCLI

  CandlepinCLI.subcommand('GetRootResources') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RootResource.getRootResources")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetRootResources')
    end
  end                           # entrypoint GetRootResources

  CandlepinCLI.subcommand('DeleteActivationKey') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.deleteActivationKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/activation_keys/{activation_key_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_key_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.activation_key_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteActivationKey')
    end
  end                           # entrypoint DeleteActivationKey

  CandlepinCLI.subcommand('GetActivationKey') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.getActivationKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/activation_keys/{activation_key_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_key_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.activation_key_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetActivationKey')
    end
  end                           # entrypoint GetActivationKey

  CandlepinCLI.subcommand('UpdateActivationKey') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.updateActivationKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/activation_keys/{activation_key_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_key_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.activation_key_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateActivationKey')
    end
  end                           # entrypoint UpdateActivationKey

  CandlepinCLI.subcommand('AddPoolToKeyActivationKey') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.addPoolToKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/activation_keys/{activation_key_id}/pools/{pool_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_key_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.activation_key_id = value
    end
    cdef.required(nil, :pool_id,
                  "[Mandatory] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool_id = value
    end
    cdef.required(nil, :quantity,
                  "[Query argument] An integer.") do |value,cmd|
      CandlepinCLI.options.quantity = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::AddPoolToKeyActivationKey')
    end
  end                           # entrypoint AddPoolToKeyActivationKey

  CandlepinCLI.subcommand('RemovePoolFromKeyActivationKey') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.removePoolFromKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/activation_keys/{activation_key_id}/pools/{pool_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_key_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.activation_key_id = value
    end
    cdef.required(nil, :pool_id,
                  "[Mandatory] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RemovePoolFromKeyActivationKey')
    end
  end                           # entrypoint RemovePoolFromKeyActivationKey

  CandlepinCLI.subcommand('GetActivationKeyPools') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.getActivationKeyPools")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/activation_keys/{activation_key_id}/pools

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_key_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.activation_key_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetActivationKeyPools')
    end
  end                           # entrypoint GetActivationKeyPools

  CandlepinCLI.subcommand('FindActivationKey') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ActivationKeyResource.findActivationKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/activation_keys

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::FindActivationKey')
    end
  end                           # entrypoint FindActivationKey

  CandlepinCLI.subcommand('InitializeAdmin') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.AdminResource.initialize")
    cdef.description(<<-EOD)
 Currently this just creates the admin user for standalone deployments using the
default user service adapter. It must be called once after candlepin is installed,
repeat calls are not required, but will be harmless.

    REST: GET /candlepin/admin/init

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::InitializeAdmin')
    end
  end                           # entrypoint InitializeAdmin

  CandlepinCLI.subcommand('GetFeedAtomFeed') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.AtomFeedResource.getFeed")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/atom

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetFeedAtomFeed')
    end
  end                           # entrypoint GetFeedAtomFeed

  CandlepinCLI.subcommand('DeleteConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.deleteConsumer")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/consumers/{consumer_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteConsumer')
    end
  end                           # entrypoint DeleteConsumer

  CandlepinCLI.subcommand('GetConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getConsumer")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetConsumer')
    end
  end                           # entrypoint GetConsumer

  CandlepinCLI.subcommand('RegenerateIdentityCertificatesConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.regenerateIdentityCertificates")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/consumers/{consumer_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RegenerateIdentityCertificatesConsumer')
    end
  end                           # entrypoint RegenerateIdentityCertificatesConsumer

  CandlepinCLI.subcommand('UpdateConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.updateConsumer")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/consumers/{consumer_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateConsumer')
    end
  end                           # entrypoint UpdateConsumer

  CandlepinCLI.subcommand('UnbindBySerialConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.unbindBySerial")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/consumers/{consumer_uuid}/certificates/{serial}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :serial_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.serial_id = value
    end
    cdef.required(nil, :serial,
                  "Synonym for --serial_id") do |value,cmd|
      CandlepinCLI.options.serial_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UnbindBySerialConsumer')
    end
  end                           # entrypoint UnbindBySerialConsumer

  CandlepinCLI.subcommand('GetEntitlementCertificatesConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getEntitlementCertificates")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/certificates

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :serials,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.serials = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEntitlementCertificatesConsumer')
    end
  end                           # entrypoint GetEntitlementCertificatesConsumer

  CandlepinCLI.subcommand('RegenerateEntitlementCertificatesConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.regenerateEntitlementCertificates")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/consumers/{consumer_uuid}/certificates

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :entitlement,
                  "[Query argument] An entitlement ID.") do |value,cmd|
      CandlepinCLI.options.entitlement = value
    end
    cdef.required(nil, :lazy_regen,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.lazy_regen = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RegenerateEntitlementCertificatesConsumer')
    end
  end                           # entrypoint RegenerateEntitlementCertificatesConsumer

  CandlepinCLI.subcommand('GetEntitlementCertificateSerialsConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getEntitlementCertificateSerials")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/certificates/serials

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEntitlementCertificateSerialsConsumer')
    end
  end                           # entrypoint GetEntitlementCertificateSerialsConsumer

  CandlepinCLI.subcommand('GetComplianceStatusConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getComplianceStatus")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/compliance

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :on_date,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.on_date = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetComplianceStatusConsumer')
    end
  end                           # entrypoint GetComplianceStatusConsumer

  CandlepinCLI.subcommand('RemoveDeletionRecordConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.removeDeletionRecord")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/consumers/{consumer_uuid}/deletionrecord

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RemoveDeletionRecordConsumer')
    end
  end                           # entrypoint RemoveDeletionRecordConsumer

  CandlepinCLI.subcommand('UnbindConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.unbind")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/consumers/{consumer_uuid}/entitlements/{dbid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :entitlement_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :dbid,
                  "Synonym for --entitlement_id") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UnbindConsumer')
    end
  end                           # entrypoint UnbindConsumer

  CandlepinCLI.subcommand('BindConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.bind")
    cdef.description(<<-EOD)
 If a pool ID is specified, we know we're binding to that exact pool. Specifying
an entitle date in this case makes no sense and will throw an error.

    REST: POST /candlepin/consumers/{consumer_uuid}/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :async,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.async = value
    end
    cdef.required(nil, :email,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.email = value
    end
    cdef.required(nil, :email_locale,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.email_locale = value
    end
    cdef.required(nil, :entitle_date,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.entitle_date = value
    end
    cdef.required(nil, :pool,
                  "[Query argument] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool = value
    end
    cdef.required(nil, :product,
                  "[Query argument] A list of strings.") do |value,cmd|
      CandlepinCLI.options.product = value
    end
    cdef.required(nil, :quantity,
                  "[Query argument] An integer.") do |value,cmd|
      CandlepinCLI.options.quantity = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::BindConsumer')
    end
  end                           # entrypoint BindConsumer

  CandlepinCLI.subcommand('ListEntitlementsConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.listEntitlements")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :product,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.product = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListEntitlementsConsumer')
    end
  end                           # entrypoint ListEntitlementsConsumer

  CandlepinCLI.subcommand('UnbindAllConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.unbindAll")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/consumers/{consumer_uuid}/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UnbindAllConsumer')
    end
  end                           # entrypoint UnbindAllConsumer

  CandlepinCLI.subcommand('DryBindConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.dryBind")
    cdef.description(<<-EOD)
 This is a dry run of an autobind. It allows the client to see what would be the
result of an autobind without executing it. It can only do this for the prevously
established list of installed products for the consumer

    REST: GET /candlepin/consumers/{consumer_uuid}/entitlements/dry-run

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :service_level,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.service_level = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DryBindConsumer')
    end
  end                           # entrypoint DryBindConsumer

  CandlepinCLI.subcommand('GetConsumerEvents') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getConsumerEvents")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/events

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetConsumerEvents')
    end
  end                           # entrypoint GetConsumerEvents

  CandlepinCLI.subcommand('ExportDataConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.exportData")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/export

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ExportDataConsumer')
    end
  end                           # entrypoint ExportDataConsumer

  CandlepinCLI.subcommand('GetGuestsConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getGuests")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/guests

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetGuestsConsumer')
    end
  end                           # entrypoint GetGuestsConsumer

  CandlepinCLI.subcommand('GetHostConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getHost")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/host

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetHostConsumer')
    end
  end                           # entrypoint GetHostConsumer

  CandlepinCLI.subcommand('GetOwnerConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getOwner")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/owner

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetOwnerConsumer')
    end
  end                           # entrypoint GetOwnerConsumer

  CandlepinCLI.subcommand('GetReleaseConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getRelease")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/{consumer_uuid}/release

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Mandatory] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetReleaseConsumer')
    end
  end                           # entrypoint GetReleaseConsumer

  CandlepinCLI.subcommand('CreateConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.create")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/consumers

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activation_keys,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.activation_keys = value
    end
    cdef.required(nil, :owner,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.owner = value
    end
    cdef.required(nil, :username,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateConsumer')
    end
  end                           # entrypoint CreateConsumer

  CandlepinCLI.subcommand('ListConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :owner,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.owner = value
    end
    cdef.required(nil, :type,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.type = value
    end
    cdef.required(nil, :username,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.required(nil, :uuid,
                  "[Query argument] A list.") do |value,cmd|
      CandlepinCLI.options.uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListConsumer')
    end
  end                           # entrypoint ListConsumer

  CandlepinCLI.subcommand('GetComplianceStatusListConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerResource.getComplianceStatusList")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumers/compliance

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :uuid,
                  "[Query argument] A list.") do |value,cmd|
      CandlepinCLI.options.uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetComplianceStatusListConsumer')
    end
  end                           # entrypoint GetComplianceStatusListConsumer

  CandlepinCLI.subcommand('DeleteConsumerType') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerTypeResource.deleteConsumerType")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/consumertypes/{id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumertype_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.consumertype_id = value
    end
    cdef.required(nil, :id,
                  "Synonym for --consumertype_id") do |value,cmd|
      CandlepinCLI.options.consumertype_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteConsumerType')
    end
  end                           # entrypoint DeleteConsumerType

  CandlepinCLI.subcommand('GetConsumerType') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerTypeResource.getConsumerType")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumertypes/{id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumertype_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.consumertype_id = value
    end
    cdef.required(nil, :id,
                  "Synonym for --consumertype_id") do |value,cmd|
      CandlepinCLI.options.consumertype_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetConsumerType')
    end
  end                           # entrypoint GetConsumerType

  CandlepinCLI.subcommand('UpdateConsumerType') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerTypeResource.update")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/consumertypes/{id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumertype_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.consumertype_id = value
    end
    cdef.required(nil, :id,
                  "Synonym for --consumertype_id") do |value,cmd|
      CandlepinCLI.options.consumertype_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateConsumerType')
    end
  end                           # entrypoint UpdateConsumerType

  CandlepinCLI.subcommand('CreateConsumerType') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerTypeResource.create")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/consumertypes

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateConsumerType')
    end
  end                           # entrypoint CreateConsumerType

  CandlepinCLI.subcommand('ListConsumerType') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ConsumerTypeResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/consumertypes

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListConsumerType')
    end
  end                           # entrypoint ListConsumerType

  CandlepinCLI.subcommand('GetContent') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ContentResource.getContent")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/content/{content_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :content_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.content_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetContent')
    end
  end                           # entrypoint GetContent

  CandlepinCLI.subcommand('RemoveContent') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ContentResource.remove")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/content/{content_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :content_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.content_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RemoveContent')
    end
  end                           # entrypoint RemoveContent

  CandlepinCLI.subcommand('UpdateContent') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ContentResource.updateContent")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/content/{content_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :content_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.content_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateContent')
    end
  end                           # entrypoint UpdateContent

  CandlepinCLI.subcommand('CreateContent') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ContentResource.createContent")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/content

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateContent')
    end
  end                           # entrypoint CreateContent

  CandlepinCLI.subcommand('ListContent') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ContentResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/content

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListContent')
    end
  end                           # entrypoint ListContent

  CandlepinCLI.subcommand('GetCurrentCrl') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.CrlResource.getCurrentCrl")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/crl

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetCurrentCrl')
    end
  end                           # entrypoint GetCurrentCrl

  CandlepinCLI.subcommand('UnrevokeCrl') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.CrlResource.unrevoke")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/crl

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :serial,
                  "[Query argument] A list of strings.") do |value,cmd|
      CandlepinCLI.options.serial = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UnrevokeCrl')
    end
  end                           # entrypoint UnrevokeCrl

  CandlepinCLI.subcommand('ListByDateDeletedConsumer') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.DeletedConsumerResource.listByDate")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/deleted_consumers

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :date,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.date = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListByDateDeletedConsumer')
    end
  end                           # entrypoint ListByDateDeletedConsumer

  CandlepinCLI.subcommand('DeleteDistributorVersion') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.DistributorVersionResource.delete")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/distributor_versions/{id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteDistributorVersion')
    end
  end                           # entrypoint DeleteDistributorVersion

  CandlepinCLI.subcommand('UpdateDistributorVersion') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.DistributorVersionResource.update")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/distributor_versions/{id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateDistributorVersion')
    end
  end                           # entrypoint UpdateDistributorVersion

  CandlepinCLI.subcommand('CreateDistributorVersion') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.DistributorVersionResource.create")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/distributor_versions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateDistributorVersion')
    end
  end                           # entrypoint CreateDistributorVersion

  CandlepinCLI.subcommand('GetVersionsDistributorVersion') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.DistributorVersionResource.getVersions")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/distributor_versions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetVersionsDistributorVersion')
    end
  end                           # entrypoint GetVersionsDistributorVersion

  CandlepinCLI.subcommand('GetEntitlement') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.getEntitlement")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/entitlements/{entitlement_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :entitlement_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :dbid,
                  "Synonym for --entitlement_id") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :entitlement_id,
                  "[Mandatory] A entitlement ID.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEntitlement')
    end
  end                           # entrypoint GetEntitlement

  CandlepinCLI.subcommand('UnbindEntitlement') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.unbind")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/entitlements/{entitlement_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :entitlement_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :dbid,
                  "Synonym for --entitlement_id") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :entitlement_id,
                  "[Mandatory] A entitlement ID.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UnbindEntitlement')
    end
  end                           # entrypoint UnbindEntitlement

  CandlepinCLI.subcommand('UpdateEntitlement') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.updateEntitlement")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/entitlements/{entitlement_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :entitlement_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :dbid,
                  "Synonym for --entitlement_id") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.required(nil, :entitlement_id,
                  "[Mandatory] A entitlement ID.") do |value,cmd|
      CandlepinCLI.options.entitlement_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateEntitlement')
    end
  end                           # entrypoint UpdateEntitlement

  CandlepinCLI.subcommand('GetEntitlementUpstreamCert') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.getEntitlementUpstreamCert")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/entitlements/{dbid}/upstream_cert

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :dbid,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.dbid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEntitlementUpstreamCert')
    end
  end                           # entrypoint GetEntitlementUpstreamCert

  CandlepinCLI.subcommand('ListAllForConsumerEntitlement') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.listAllForConsumer")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.consumer = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListAllForConsumerEntitlement')
    end
  end                           # entrypoint ListAllForConsumerEntitlement

  CandlepinCLI.subcommand('HasEntitlement') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.hasEntitlement")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/entitlements/consumer/{consumer_uuid}/product/{product_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::HasEntitlement')
    end
  end                           # entrypoint HasEntitlement

  CandlepinCLI.subcommand('RegenerateEntitlementCertificatesForProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EntitlementResource.regenerateEntitlementCertificatesForProduct")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/entitlements/product/{product_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :lazy_regen,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.lazy_regen = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RegenerateEntitlementCertificatesForProduct')
    end
  end                           # entrypoint RegenerateEntitlementCertificatesForProduct

  CandlepinCLI.subcommand('DeleteEnvEnvironment') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EnvironmentResource.deleteEnv")
    cdef.description(<<-EOD)
 WARNING: this will delete all consumers in the environment and revoke their
entitlement certificates.

    REST: DELETE /candlepin/environments/{env_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :env_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.env_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteEnvEnvironment')
    end
  end                           # entrypoint DeleteEnvEnvironment

  CandlepinCLI.subcommand('GetEnvEnvironment') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EnvironmentResource.getEnv")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/environments/{env_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :env_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.env_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEnvEnvironment')
    end
  end                           # entrypoint GetEnvEnvironment

  CandlepinCLI.subcommand('CreateEnvironment') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EnvironmentResource.create")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/environments/{env_id}/consumers

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :env_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.env_id = value
    end
    cdef.required(nil, :activation_keys,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.activation_keys = value
    end
    cdef.required(nil, :owner,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.owner = value
    end
    cdef.required(nil, :username,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateEnvironment')
    end
  end                           # entrypoint CreateEnvironment

  CandlepinCLI.subcommand('DemoteContentEnvironment') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EnvironmentResource.demoteContent")
    cdef.description(<<-EOD)
 Consumer's registered to this environment will no see this content in their
entitlement certificates. (after they are regenerated and synced to clients)

    REST: DELETE /candlepin/environments/{env_id}/content

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :env_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.env_id = value
    end
    cdef.required(nil, :content,
                  "[Query argument] A list of strings.") do |value,cmd|
      CandlepinCLI.options.content = value
    end
    cdef.required(nil, :lazy_regen,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.lazy_regen = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DemoteContentEnvironment')
    end
  end                           # entrypoint DemoteContentEnvironment

  CandlepinCLI.subcommand('PromoteContentEnvironment') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EnvironmentResource.promoteContent")
    cdef.description(<<-EOD)
 This call accepts multiple content sets to promote at once, after which
all affected certificates for consumers in the enironment will be
regenerated.

    REST: POST /candlepin/environments/{env_id}/content

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :env_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.env_id = value
    end
    cdef.required(nil, :lazy_regen,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.lazy_regen = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::PromoteContentEnvironment')
    end
  end                           # entrypoint PromoteContentEnvironment

  CandlepinCLI.subcommand('GetEnvironments') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EnvironmentResource.getEnvironments")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/environments

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEnvironments')
    end
  end                           # entrypoint GetEnvironments

  CandlepinCLI.subcommand('GetEvent') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EventResource.getEvent")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/events/{uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :event_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.event_id = value
    end
    cdef.required(nil, :uuid,
                  "Synonym for --event_id") do |value,cmd|
      CandlepinCLI.options.event_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEvent')
    end
  end                           # entrypoint GetEvent

  CandlepinCLI.subcommand('ListEvents') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.EventResource.listEvents")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/events

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListEvents')
    end
  end                           # entrypoint ListEvents

  CandlepinCLI.subcommand('HypervisorCheckIn') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.HypervisorResource.hypervisorCheckIn")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/hypervisors

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :owner,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.owner = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::HypervisorCheckIn')
    end
  end                           # entrypoint HypervisorCheckIn

  CandlepinCLI.subcommand('CancelJob') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.JobResource.cancel")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/jobs/{job_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :job_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.job_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CancelJob')
    end
  end                           # entrypoint CancelJob

  CandlepinCLI.subcommand('GetStatusJob') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.JobResource.getStatus")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/jobs/{job_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :job_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.job_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetStatusJob')
    end
  end                           # entrypoint GetStatusJob

  CandlepinCLI.subcommand('GetStatusAndDeleteIfFinishedJob') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.JobResource.getStatusAndDeleteIfFinished")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/jobs/{job_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :job_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.job_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetStatusAndDeleteIfFinishedJob')
    end
  end                           # entrypoint GetStatusAndDeleteIfFinishedJob

  CandlepinCLI.subcommand('GetStatusesJob') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.JobResource.getStatuses")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/jobs

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.consumer = value
    end
    cdef.required(nil, :owner,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.owner = value
    end
    cdef.required(nil, :principal,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.principal = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetStatusesJob')
    end
  end                           # entrypoint GetStatusesJob

  CandlepinCLI.subcommand('GetSchedulerStatusJob') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.JobResource.getSchedulerStatus")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/jobs/scheduler

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetSchedulerStatusJob')
    end
  end                           # entrypoint GetSchedulerStatusJob

  CandlepinCLI.subcommand('SetSchedulerStatusJob') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.JobResource.setSchedulerStatus")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/jobs/scheduler

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::SetSchedulerStatusJob')
    end
  end                           # entrypoint SetSchedulerStatusJob

  CandlepinCLI.subcommand('CreateMigration') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.MigrationResource.createMigration")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/migrations

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :delete,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.delete = value
    end
    cdef.required(nil, :entity,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.entity = value
    end
    cdef.required(nil, :id,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.id = value
    end
    cdef.required(nil, :uri,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.uri = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateMigration')
    end
  end                           # entrypoint CreateMigration

  CandlepinCLI.subcommand('DeleteOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.deleteOwner")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/owners/{owner_key}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :revoke,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.revoke = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteOwner')
    end
  end                           # entrypoint DeleteOwner

  CandlepinCLI.subcommand('GetOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getOwner")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetOwner')
    end
  end                           # entrypoint GetOwner

  CandlepinCLI.subcommand('UpdateOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.updateOwner")
    cdef.description(<<-EOD)
 To un-set the defaultServiceLevel for an owner, submit an empty string.

    REST: PUT /candlepin/owners/{owner_key}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateOwner')
    end
  end                           # entrypoint UpdateOwner

  CandlepinCLI.subcommand('CreateActivationKeyOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.createActivationKey")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners/{owner_key}/activation_keys

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateActivationKeyOwner')
    end
  end                           # entrypoint CreateActivationKeyOwner

  CandlepinCLI.subcommand('OwnerActivationKeys') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.ownerActivationKeys")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/activation_keys

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::OwnerActivationKeys')
    end
  end                           # entrypoint OwnerActivationKeys

  CandlepinCLI.subcommand('GetOwnerAtomFeed') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getOwnerAtomFeed")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/atom

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetOwnerAtomFeed')
    end
  end                           # entrypoint GetOwnerAtomFeed

  CandlepinCLI.subcommand('GetConsumerAtomFeedOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getConsumerAtomFeed")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/consumers/{consumer_uuid}/atom

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetConsumerAtomFeedOwner')
    end
  end                           # entrypoint GetConsumerAtomFeedOwner

  CandlepinCLI.subcommand('OwnerConsumers') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.ownerConsumers")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/consumers

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :type,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.type = value
    end
    cdef.required(nil, :username,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.required(nil, :uuid,
                  "[Query argument] A list.") do |value,cmd|
      CandlepinCLI.options.uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::OwnerConsumers')
    end
  end                           # entrypoint OwnerConsumers

  CandlepinCLI.subcommand('HealEntireOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.healEntire")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners/{owner_key}/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::HealEntireOwner')
    end
  end                           # entrypoint HealEntireOwner

  CandlepinCLI.subcommand('OwnerEntitlements') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.ownerEntitlements")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::OwnerEntitlements')
    end
  end                           # entrypoint OwnerEntitlements

  CandlepinCLI.subcommand('CreateEnvOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.createEnv")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners/{owner_key}/environments

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateEnvOwner')
    end
  end                           # entrypoint CreateEnvOwner

  CandlepinCLI.subcommand('ListEnvironmentsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.listEnvironments")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/environments

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :name,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.name = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListEnvironmentsOwner')
    end
  end                           # entrypoint ListEnvironmentsOwner

  CandlepinCLI.subcommand('GetEventsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getEvents")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/events

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetEventsOwner')
    end
  end                           # entrypoint GetEventsOwner

  CandlepinCLI.subcommand('GetImportsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getImports")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/imports

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetImportsOwner')
    end
  end                           # entrypoint GetImportsOwner

  CandlepinCLI.subcommand('ImportManifestOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.importManifest")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners/{owner_key}/imports

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :force,
                  "[Query argument] A list of strings.") do |value,cmd|
      CandlepinCLI.options.force = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ImportManifestOwner')
    end
  end                           # entrypoint ImportManifestOwner

  CandlepinCLI.subcommand('UndoImportsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.undoImports")
    cdef.description(<<-EOD)
 This call does not differentiate between any specific import, it just
destroys all subscriptions with an upstream pool ID, essentially anything from
an import. Custom subscriptions will be left alone.

    REST: DELETE /candlepin/owners/{owner_key}/imports

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UndoImportsOwner')
    end
  end                           # entrypoint UndoImportsOwner

  CandlepinCLI.subcommand('GetOwnerInfo') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getOwnerInfo")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/info

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetOwnerInfo')
    end
  end                           # entrypoint GetOwnerInfo

  CandlepinCLI.subcommand('GetPoolsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getPools")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/pools

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :activeon,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.activeon = value
    end
    cdef.required(nil, :consumer,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.consumer = value
    end
    cdef.required(nil, :listall,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.listall = value
    end
    cdef.required(nil, :product,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.product = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetPoolsOwner')
    end
  end                           # entrypoint GetPoolsOwner

  CandlepinCLI.subcommand('OwnerServiceLevels') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.ownerServiceLevels")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/servicelevels

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::OwnerServiceLevels')
    end
  end                           # entrypoint OwnerServiceLevels

  CandlepinCLI.subcommand('GetStatisticsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getStatistics")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/statistics/{qtype}/{vtype}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :qtype,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.qtype = value
    end
    cdef.required(nil, :vtype,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.vtype = value
    end
    cdef.required(nil, :days,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.days = value
    end
    cdef.required(nil, :from,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.from = value
    end
    cdef.required(nil, :reference,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.reference = value
    end
    cdef.required(nil, :to,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.to = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetStatisticsOwner')
    end
  end                           # entrypoint GetStatisticsOwner

  CandlepinCLI.subcommand('CreateSubscriptionOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.createSubscription")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners/{owner_key}/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateSubscriptionOwner')
    end
  end                           # entrypoint CreateSubscriptionOwner

  CandlepinCLI.subcommand('GetSubscriptionsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getSubscriptions")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetSubscriptionsOwner')
    end
  end                           # entrypoint GetSubscriptionsOwner

  CandlepinCLI.subcommand('RefreshPoolsOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.refreshPools")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/owners/{owner_key}/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :auto_create_owner,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.auto_create_owner = value
    end
    cdef.required(nil, :lazy_regen,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.lazy_regen = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RefreshPoolsOwner')
    end
  end                           # entrypoint RefreshPoolsOwner

  CandlepinCLI.subcommand('CreateUeberCertificateOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.createUeberCertificate")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners/{owner_key}/uebercert

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateUeberCertificateOwner')
    end
  end                           # entrypoint CreateUeberCertificateOwner

  CandlepinCLI.subcommand('GetUeberCertificateOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getUeberCertificate")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/uebercert

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetUeberCertificateOwner')
    end
  end                           # entrypoint GetUeberCertificateOwner

  CandlepinCLI.subcommand('GetUpstreamConsumersOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.getUpstreamConsumers")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners/{owner_key}/upstream_consumers

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :org_id,
                  "[Mandatory] A organisation/key/customer ID.") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.required(nil, :owner_key,
                  "Synonym for --org_id") do |value,cmd|
      CandlepinCLI.options.org_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetUpstreamConsumersOwner')
    end
  end                           # entrypoint GetUpstreamConsumersOwner

  CandlepinCLI.subcommand('CreateOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.createOwner")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/owners

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateOwner')
    end
  end                           # entrypoint CreateOwner

  CandlepinCLI.subcommand('ListOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/owners

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :key,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.key = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListOwner')
    end
  end                           # entrypoint ListOwner

  CandlepinCLI.subcommand('UpdateSubscriptionOwner') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.OwnerResource.updateSubscription")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/owners/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateSubscriptionOwner')
    end
  end                           # entrypoint UpdateSubscriptionOwner

  CandlepinCLI.subcommand('DeletePool') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.PoolResource.deletePool")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/pools/{pool_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :pool_id,
                  "[Mandatory] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeletePool')
    end
  end                           # entrypoint DeletePool

  CandlepinCLI.subcommand('GetPool') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.PoolResource.getPool")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/pools/{pool_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :pool_id,
                  "[Mandatory] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool_id = value
    end
    cdef.required(nil, :consumer,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.consumer = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetPool')
    end
  end                           # entrypoint GetPool

  CandlepinCLI.subcommand('GetPoolEntitlements') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.PoolResource.getPoolEntitlements")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/pools/{pool_id}/entitlements

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :pool_id,
                  "[Mandatory] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetPoolEntitlements')
    end
  end                           # entrypoint GetPoolEntitlements

  CandlepinCLI.subcommand('GetPoolStats') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.PoolResource.getPoolStats")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/pools/{pool_id}/statistics/{vtype}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :pool_id,
                  "[Mandatory] A pool ID.") do |value,cmd|
      CandlepinCLI.options.pool_id = value
    end
    cdef.required(nil, :vtype,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.vtype = value
    end
    cdef.required(nil, :days,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.days = value
    end
    cdef.required(nil, :from,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.from = value
    end
    cdef.required(nil, :to,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.to = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetPoolStats')
    end
  end                           # entrypoint GetPoolStats

  CandlepinCLI.subcommand('ListPool') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.PoolResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/pools

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :activeon,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.activeon = value
    end
    cdef.required(nil, :consumer,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.consumer = value
    end
    cdef.required(nil, :listall,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.listall = value
    end
    cdef.required(nil, :owner,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.owner = value
    end
    cdef.required(nil, :product,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.product = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListPool')
    end
  end                           # entrypoint ListPool

  CandlepinCLI.subcommand('DeleteProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.deleteProduct")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/products/{product_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteProduct')
    end
  end                           # entrypoint DeleteProduct

  CandlepinCLI.subcommand('GetProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.getProduct")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/products/{product_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetProduct')
    end
  end                           # entrypoint GetProduct

  CandlepinCLI.subcommand('UpdateProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.updateProduct")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/products/{product_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateProduct')
    end
  end                           # entrypoint UpdateProduct

  CandlepinCLI.subcommand('GetProductCertificate') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.getProductCertificate")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/products/{product_uuid}/certificate

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetProductCertificate')
    end
  end                           # entrypoint GetProductCertificate

  CandlepinCLI.subcommand('AddContentProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.addContent")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/products/{product_uuid}/content/{content_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :content_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.content_id = value
    end
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :enabled,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.enabled = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::AddContentProduct')
    end
  end                           # entrypoint AddContentProduct

  CandlepinCLI.subcommand('RemoveContentProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.removeContent")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/products/{product_uuid}/content/{content_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :content_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.content_id = value
    end
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RemoveContentProduct')
    end
  end                           # entrypoint RemoveContentProduct

  CandlepinCLI.subcommand('AddRelianceProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.addReliance")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/products/{product_uuid}/reliance/{rely_product_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :rely_product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.rely_product_id = value
    end
    cdef.required(nil, :rely_product_uuid,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.rely_product_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::AddRelianceProduct')
    end
  end                           # entrypoint AddRelianceProduct

  CandlepinCLI.subcommand('RemoveRelianceProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.removeReliance")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/products/{product_uuid}/reliance/{rely_product_uuid}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :rely_product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.rely_product_id = value
    end
    cdef.required(nil, :rely_product_uuid,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.rely_product_uuid = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RemoveRelianceProduct')
    end
  end                           # entrypoint RemoveRelianceProduct

  CandlepinCLI.subcommand('GetProductStats') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.getProductStats")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/products/{prod_id}/statistics

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :prod_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.prod_id = value
    end
    cdef.required(nil, :days,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.days = value
    end
    cdef.required(nil, :from,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.from = value
    end
    cdef.required(nil, :to,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.to = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetProductStats')
    end
  end                           # entrypoint GetProductStats

  CandlepinCLI.subcommand('RefreshPoolsForProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.refreshPoolsForProduct")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/products/{product_uuid}/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :product_uuid,
                  "Synonym for --product_id") do |value,cmd|
      CandlepinCLI.options.product_id = value
    end
    cdef.required(nil, :lazy_regen,
                  "[Query argument] A Boolean.") do |value,cmd|
      CandlepinCLI.options.lazy_regen = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RefreshPoolsForProduct')
    end
  end                           # entrypoint RefreshPoolsForProduct

  CandlepinCLI.subcommand('CreateProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.createProduct")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/products

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateProduct')
    end
  end                           # entrypoint CreateProduct

  CandlepinCLI.subcommand('ListProduct') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/products

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListProduct')
    end
  end                           # entrypoint ListProduct

  CandlepinCLI.subcommand('GetActiveProductOwners') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.ProductResource.getActiveProductOwners")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/products/owners

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :product,
                  "[Query argument] A list of strings.") do |value,cmd|
      CandlepinCLI.options.product = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetActiveProductOwners')
    end
  end                           # entrypoint GetActiveProductOwners

  CandlepinCLI.subcommand('DeleteRole') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.deleteRole")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/roles/{role_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteRole')
    end
  end                           # entrypoint DeleteRole

  CandlepinCLI.subcommand('GetRole') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.getRole")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/roles/{role_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetRole')
    end
  end                           # entrypoint GetRole

  CandlepinCLI.subcommand('UpdateRole') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.updateRole")
    cdef.description(<<-EOD)
 To avoid race conditions, we do not support updating the user or permission
collections. Currently this call will only update the role name.

    REST: PUT /candlepin/roles/{role_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateRole')
    end
  end                           # entrypoint UpdateRole

  CandlepinCLI.subcommand('RemoveRolePermission') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.removeRolePermission")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/roles/{role_id}/permissions/{perm_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :perm_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.perm_id = value
    end
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::RemoveRolePermission')
    end
  end                           # entrypoint RemoveRolePermission

  CandlepinCLI.subcommand('AddRolePermission') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.addRolePermission")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/roles/{role_id}/permissions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::AddRolePermission')
    end
  end                           # entrypoint AddRolePermission

  CandlepinCLI.subcommand('AddUserRole') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.addUser")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/roles/{role_id}/users/{username}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.required(nil, :username,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::AddUserRole')
    end
  end                           # entrypoint AddUserRole

  CandlepinCLI.subcommand('DeleteUserRole') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.deleteUser")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/roles/{role_id}/users/{username}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :role_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.role_id = value
    end
    cdef.required(nil, :username,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteUserRole')
    end
  end                           # entrypoint DeleteUserRole

  CandlepinCLI.subcommand('CreateRole') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.createRole")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/roles

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateRole')
    end
  end                           # entrypoint CreateRole

  CandlepinCLI.subcommand('GetRoles') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RoleResource.getRoles")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/roles

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetRoles')
    end
  end                           # entrypoint GetRoles

  CandlepinCLI.subcommand('DeleteRules') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RulesResource.delete")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/rules

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteRules')
    end
  end                           # entrypoint DeleteRules

  CandlepinCLI.subcommand('GetRules') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RulesResource.get")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/rules

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetRules')
    end
  end                           # entrypoint GetRules

  CandlepinCLI.subcommand('UploadRules') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.RulesResource.upload")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/rules

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UploadRules')
    end
  end                           # entrypoint UploadRules

  CandlepinCLI.subcommand('GetCertificateSerial') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.CertificateSerialResource.getCertificateSerial")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/serials/{serial_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :serial_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.serial_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetCertificateSerial')
    end
  end                           # entrypoint GetCertificateSerial

  CandlepinCLI.subcommand('GetCertificateSerials') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.CertificateSerialResource.getCertificateSerials")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/serials

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetCertificateSerials')
    end
  end                           # entrypoint GetCertificateSerials

  CandlepinCLI.subcommand('ExecuteStatistic') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.StatisticResource.execute")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/statistics/generate

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ExecuteStatistic')
    end
  end                           # entrypoint ExecuteStatistic

  CandlepinCLI.subcommand('Status') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.StatusResource.status")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/status

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::Status')
    end
  end                           # entrypoint Status

  CandlepinCLI.subcommand('DeleteSubscription') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.SubscriptionResource.deleteSubscription")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/subscriptions/{subscription_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :subscription_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.subscription_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteSubscription')
    end
  end                           # entrypoint DeleteSubscription

  CandlepinCLI.subcommand('GetSubscription') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.SubscriptionResource.getSubscription")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/subscriptions/{subscription_id}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :subscription_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.subscription_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetSubscription')
    end
  end                           # entrypoint GetSubscription

  CandlepinCLI.subcommand('GetSubCertAsPemSubscription') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.SubscriptionResource.getSubCertAsPem")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/subscriptions/{subscription_id}/cert

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :subscription_id,
                  "Undocumented.") do |value,cmd|
      CandlepinCLI.options.subscription_id = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetSubCertAsPemSubscription')
    end
  end                           # entrypoint GetSubCertAsPemSubscription

  CandlepinCLI.subcommand('ActivateSubscription') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.SubscriptionResource.activateSubscription")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :consumer_uuid,
                  "[Query argument] A consumer UUID.") do |value,cmd|
      CandlepinCLI.options.consumer_uuid = value
    end
    cdef.required(nil, :email,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.email = value
    end
    cdef.required(nil, :email_locale,
                  "[Query argument] A string.") do |value,cmd|
      CandlepinCLI.options.email_locale = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ActivateSubscription')
    end
  end                           # entrypoint ActivateSubscription

  CandlepinCLI.subcommand('GetSubscriptions') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.SubscriptionResource.getSubscriptions")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/subscriptions

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetSubscriptions')
    end
  end                           # entrypoint GetSubscriptions

  CandlepinCLI.subcommand('DeleteUser') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.deleteUser")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: DELETE /candlepin/users/{username}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :username,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::DeleteUser')
    end
  end                           # entrypoint DeleteUser

  CandlepinCLI.subcommand('GetUserInfo') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.getUserInfo")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/users/{username}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :username,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetUserInfo')
    end
  end                           # entrypoint GetUserInfo

  CandlepinCLI.subcommand('UpdateUser') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.updateUser")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: PUT /candlepin/users/{username}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :username,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::UpdateUser')
    end
  end                           # entrypoint UpdateUser

  CandlepinCLI.subcommand('ListUsersOwners') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.listUsersOwners")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/users/{username}/owners

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :username,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListUsersOwners')
    end
  end                           # entrypoint ListUsersOwners

  CandlepinCLI.subcommand('GetUserRoles') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.getUserRoles")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/users/{username}/roles

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.required(nil, :username,
                  "[Mandatory] Undocumented.") do |value,cmd|
      CandlepinCLI.options.username = value
    end
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::GetUserRoles')
    end
  end                           # entrypoint GetUserRoles

  CandlepinCLI.subcommand('CreateUser') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.createUser")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: POST /candlepin/users

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::CreateUser')
    end
  end                           # entrypoint CreateUser

  CandlepinCLI.subcommand('ListUser') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("org.candlepin.resource.UserResource.list")
    cdef.description(<<-EOD)
No description available for this entrypoint.

    REST: GET /candlepin/users

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::ListUser')
    end
  end                           # entrypoint ListUser


end                             # module CandlepinCLI
