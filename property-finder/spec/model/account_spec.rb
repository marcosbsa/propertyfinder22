require 'rails_helper'

RSpec.describe Account, :type => :model do
    context "validation tests" do
        it "ensures email presence" do
            account = Account.new(encrypted_password: "1234rtda").save
            expect(account).to eq(false)
        end

        it "ensures password presence" do
            account = Account.new(email: "teste@realtor.com").save
            expect(account).to eq(false)
       
        it "should save successfully" do
            account = Account.new(email: "teste@realtor.com", encrypted_password: "1234rtda").save
            expect(account).to eq(true)
        end
    end

        context "scope tests" do
            let (:params) { {email: "teste@realtor.com", encrypted_password: "1234rtda"} }
            before(:each) do
            Account.new(params).save
            Account.new(params).save
            Account.new(params).save
            Account.new(params.merge(active: true)).save
            Account.new(params.merge(active: false)).save
            Account.new(params.merge(active: false)).save
            end

            it "should return active account" do
                expect(Account.active_accounts.size).to eq(3)
            end

            it "should return inactive account" do
                expect(Account.inactive_accounts.size).to eq(2)
            end
        end
    end