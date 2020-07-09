class EmailMailer < ApplicationMailer

	default from: 'alishbaather321@gmail.com'
  layout 'mailer'

  def transaction_email(user, extrapayable, plan, feature, overUse)
  	@user = user
  	@plan = plan
  	@feature = feature
  	@extrapayable = extrapayable
  	@overUse = overUse
 	  mail(to: @user.email, subject: 'Transaction Email')
  end
	  
	 def subscription_email(subscription, user)
	 	@subscription = subscription
	 	@user = user
	 	puts "&&&&&"
 	  mail(to: @user.email, subject: 'Subscription Email')

	 end
end
