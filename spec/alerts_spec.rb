describe 'Alertas de JS', :alerts do
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alerta' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'

        page.driver.browser.switch_to.alert.accept
    end

    it 'sim confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        msg = page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
        sleep 2
    end

    it 'não confirma' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        msg = page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
        sleep 2
    end

    it 'accept prompt' do
        accept_prompt(with: 'Nathanael') do
            click_button 'Prompt'
        end

        expect(page).to have_content 'Olá, Nathanael'        
    end

end