

describe 'Meu primeiro script', :smoke do

    it 'visitar a página' do
        visit '/'
        expect(page.title).to eql 'Training Wheels Protocol'
    end

end