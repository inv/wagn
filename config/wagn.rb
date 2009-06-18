System.base_url = "http://take-back-the.net"

System.max_renders = 8

ExceptionNotifier.exception_recipients = ['jens-christian@invisible.ch']
ExceptionNotifier.sender_address       = '"Wagn Error" <notifier@wagn.org>'
ExceptionNotifier.email_prefix         = "[Wagn]"

CachedCard.set_cache_prefix "#{System.host}/#{RAILS_ENV}"

# NOTE you cannot set the cache_store here, you must set it in environment.rb config section.
