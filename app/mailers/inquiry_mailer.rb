class InquiryMailer < ActionMailer::Base
  default from: "circlepit.app.info@gmail.com"   # 送信元アドレス
  default to: "circlepit.app.info@gmail.com"     # 送信先アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'Circlepitからお問い合わせを承りました')
  end

end
