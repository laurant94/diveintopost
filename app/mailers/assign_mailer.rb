class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(email, password)
    @email = email
    @password = password
    mail to: @email, subject: I18n.t('views.messages.complete_registration')
  end

  def destroy_agenda_notifier(user, agenda)
    @user = user 
    @agenda = agenda
    mail( to: @user.email, subject: I18n.t("vview.messages.agenda_destroyed_notification") )
  end
end
