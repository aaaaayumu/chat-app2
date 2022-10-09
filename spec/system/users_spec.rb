require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do

  before do
    @user = FactoryBot.create(:user)
  end
  
  it 'ログインしていない状態でトップページにアクセスした場合、サインインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
  end

  it 'ログインに成功し、トップページに遷移する' do
    # トップページへ遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移されることを確認する
    expect(current_path).to eq new_user_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user[email]', with: @user.email
    fill_in 'user_password', with: @user.password
    # ログインボタンをクリックする
    click_on 'Log in'
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path
  end
  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_user_session_path
    # 誤ったユーザーのemailとpasswordを入力する
    fill_in 'Email', with: 'test@test'
    fill_in 'user[password]', with: '111111'
    # ログインボタンをクリックする
    find('input[value="Log in"]').click
    # サインインページに戻されることを確認する
    expect(current_path).to eq new_user_session_path
  end

  
end
