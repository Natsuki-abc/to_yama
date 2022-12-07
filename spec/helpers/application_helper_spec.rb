require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'full_title' do
    context '引数が空白の場合' do
      it 'ToYamaを返すこと' do
        expect(full_title('')).to eq('ToYama')
      end
    end

    context '引数がnilの場合' do
      it 'ToYamaを返すこと' do
        expect(full_title(nil)).to eq('ToYama')
      end
    end

    context '引数が渡されている場合' do
      it 'title | ToYamaを返すこと' do
        expect(full_title('title')).to eq('title | ToYama')
      end
    end
  end
end
