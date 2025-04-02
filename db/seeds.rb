# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

emails_quiz = Quiz.find_or_create_by!(title: 'Emails')
texts_quiz = Quiz.find_or_create_by!(title: 'Texts')
websites_quiz = Quiz.find_or_create_by!(title: 'Websites')

email_questions = EmailQuestion.create([{subject: "📦 Your Order #3489323 Has Been Shipped!", link: "http://amazon-order-cancel.com",
                body: "Hello,\nThank you for your recent purchase. Your order has been processed and shipped.\nIf you didn't place this order, please cancle it immediately to avoid charges:\nCancel My Order\nBest Regards, Amazon Support",
                answer: true},
                {subject: "🚨 Urgent: Your Bank Account is at Risk!", link: "http://hsbc-secure-login.com",
                body: "Dear Valued Customer,\nWe have detected unusual activity on your account. As a security measure, your account has been temporarily suspended.\nTo restore access, please verify your account immediately by clicking the secure link below: \nVerify My Account\nFailure to do so within 24 hours may result in permanent suspension.\nSincerely, HSBC Security Team",
                answer: true},
                {subject: "⚠ Your Password Will Expire in 24 Hours!", link: "http://company-security-reset.com",
                body: "Dear Employee,\nOur security team has detected a login attempt from an unrecognized device.\nTo prevent account suspension, reset your password immediately:\nReset Password\nThis is valid for 24 hours. Please do not share this link with anyone.\nBest, IT Security Team",
                answer: true}])

email_questions.each do |question|
    emails_quiz.quiz_questions.create!(question: question)
end

text_questions = TextQuestion.create([{title: "Parcel Delivery", link: "http://royal-mail-delivery.com/error",
                    body: "Hello,\nWe regret to inform you that there has been an error in the delivery of your parcel.\nPlease click on this link to rearrange the date.\nBest,\nRoyal Mail",
                    answer: true}])

text_questions.each do |question|
    texts_quiz.quiz_questions.create!(question: question)
end

website_questions = WebsiteQuestion.create([website_id:1, url:"http://super-secure-website.ru", correct_answer:true])

website_questions.each do |question|
    websites_quiz.quiz_questions.create!(question: question)
end