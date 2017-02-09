class InquiryMailer < ActionMailer::Base
  default from: "circlepit.app.info@gmail.com" 
  default to: "circlepit.app.info@gmail.com"   

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'Circlepitからお問い合わせを承りました')
  end

end
