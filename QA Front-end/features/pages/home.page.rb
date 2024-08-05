class HomePage < SitePrism::Page

    element :search, :xpath, "//*[@id='mount_0_0_qx']/div/div[1]/div/div[3]/div/div/div[1]/div[1]/div/div[2]/div/div/div/div[3]/div/div[2]/div/div/div/div[1]/div/div[1]"

    def checkLoginSuccessful
        expect(search.text).to eql "What's on your mind, Carlos?"
    end
end