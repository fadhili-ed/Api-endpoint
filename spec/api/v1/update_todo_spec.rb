RSpec.describe 'Todo' do
  context 'valid attributes' do
    it 'updates date'
    it 'saves title'
  end

  context 'invalid attributes' do
    it 'does not allow past dates'
    it 'does not allow blank dates'
    it 'does not allow blank titles'
  end
end