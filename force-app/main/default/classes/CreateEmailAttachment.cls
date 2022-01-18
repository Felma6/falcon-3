public inherited sharing Class CreateEmailAttachment {
    public static void sendWelcomeEmailAttachmentToOwner(Id accountId){
        PageReference pageRef = Page.AccountWelcome;
        pageRef.getParameters().put('id',accountId);
        Blob attachmentContent = pageRef.getContent();

        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setBody(attachmentContent);
        attach.setFileName('Welcome Email.pdf');

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setSubject('Welcome Email with Attachment');
        email.setPlainTextBody('This email contains an attachment which is generated using Visualforce');
        Account acc = [Select Id, Owner.Email FROM Account WHERE Id = :accountId][0];
        List<string> toAddress = new List<string>{acc.Owner.Email};
        email.setToAddresses(toAddress);
        email.setFileAttachments(new List<Messaging.EmailFileAttachment>{attach});
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
    }
}