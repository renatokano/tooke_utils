require "spec_helper"

RSpec.describe TookeUtils do
  context 'in general' do
    it "has a version number" do
      expect(TookeUtils::VERSION).not_to be nil
    end
    
    it "should convert CPF in blocks of strings" do
      str = "123.456.789-00"
      blc = TookeUtils::General.to_block_of_strings str
      expect(blc[1]).to eq("123")
      expect(blc[2]).to eq("456")
      expect(blc[3]).to eq("789")
      expect(blc[4]).to eq("00")
    end
  
    it "should convert CNPJ in blocks of strings" do
      str = "41.737.186/0001-43"
      blc = TookeUtils::General.to_block_of_strings str
      expect(blc[1]).to eq("41")
      expect(blc[2]).to eq("737")
      expect(blc[3]).to eq("186")
      expect(blc[4]).to eq("0001")
      expect(blc[5]).to eq("43")
    end

    it 'should generate a valid cpf' do
      cpf = TookeUtils::CPF.generate
      expect(TookeUtils::CPF.is_valid? cpf).to eq(true)
    end

    it 'should generate a valid cnpj' do
      cnpj = TookeUtils::CNPJ.generate
      expect(TookeUtils::CNPJ.is_valid? cnpj).to eq(true)
    end

    it 'should format a valid cpf' do
      cpf = "12345678900"
      expect(TookeUtils::CPF.mask cpf).to eq("123.456.789-00")
    end

    it 'should format a valid cnpj' do
      cnpj = "41737186000143"
      expect(TookeUtils::CNPJ.mask cnpj).to eq("41.737.186/0001-43")
    end
  end

  context 'when data is valid' do
    it 'cpf has a valid format' do
      cpf = "778.050.854-47"
      expect(TookeUtils::CPF.is_cpf? cpf).to eq(true)
    end
  
    it 'cnpj has a valid format' do
      cnpj = "41.737.186/0001-43"
      expect(TookeUtils::CNPJ.is_cnpj? cnpj).to eq(true)
    end

    it 'cpf should be valid' do
      cpf = "778.050.854-47"
      expect(TookeUtils::CPF.is_valid? cpf).to eq(true)
    end

    it 'cnpj should be valid' do
      cnpj = "11.222.333/0001-81"
      expect(TookeUtils::CNPJ.is_valid? cnpj).to eq(true)
    end

    it 'mask should be nil' do
      cnpj = "778.050.854-47"
      expect(TookeUtils::CNPJ.mask cnpj).to eq(nil)
    end
  end

  context 'when data is invalid' do
    it 'cpf has an invalid format' do
      cpf = "41.737.186/0001-43"
      expect(TookeUtils::CPF.is_cpf? cpf).to eq(false)
    end
  
    it 'cnpj has an invalid format' do
      cnpj = "778.050.854-47"
      expect(TookeUtils::CNPJ.is_cnpj? cnpj).to eq(false)
    end

    it 'cpf should be invalid' do
      cpf = "778.050.854-00"
      expect(TookeUtils::CPF.is_valid? cpf).to eq(false)
    end

    it 'cnpj should not be valid' do
      cnpj = "41.737.186/0001-00"
      expect(TookeUtils::CNPJ.is_valid? cnpj).to eq(false)
    end

    it 'mask should be nil' do
      cpf = "41.737.186/0001-00"
      expect(TookeUtils::CPF.mask cpf).to eq(nil)
    end
  end
end
