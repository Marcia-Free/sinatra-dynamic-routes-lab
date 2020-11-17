require_relative 'config/environment'

class App < Sinatra::Base
  #@user_name = params[:name]
  #"Goodbye, #{@user_name}."

  get '/reversename/:name' do
    @reverse_name = params[:name].reverse
  end

  get '/square/:number' do
    @num_squared = params[:number].to_i * params[:number].to_i
    @num_squared.to_s
  end

  get '/say/:number/:phrase' do
    @say = ''
      params[:number].to_i.times { @say += params[:phrase] }
    @say
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @say = "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end


  get '/:operation/:number1/:number2' do
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i

    @answer = 'Unable to perform this operation'

    case params[:operation]
      when 'add'
        @answer = (num1 + num2).to_s
      when 'subtract'
        @answer = (num1 - num2).to_s
      when 'multiply'
        @answer = (num1 * num2).to_s
      when 'divide'
        @answer = (num1 / num2).to_s
    end
  end

end