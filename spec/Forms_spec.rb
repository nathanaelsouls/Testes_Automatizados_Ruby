

describe 'Forms'  do 
    
      it 'login com sucesso', :login do

        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'
            click_button 'Login'
            expect(find('#flash').visible?).to be true
            expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
            expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end
end