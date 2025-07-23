# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)


/ Librería de lógica reutilizable en Apex

public class LogicSnippetsLibrary {

    // --- 1. Calcular campo personalizado (Expected Revenue) ---
    public static void calculateExpectedRevenue(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            if (opp.Amount != null && opp.Probability != null) {
                opp.Expected_Revenue__c = opp.Amount * (opp.Probability / 100);
            }
        }
    }

    // --- 2. Prevenir duplicados por Email en Contact ---
    public static void preventDuplicateEmails(List<Contact> contacts) {
        Set<String> emails = new Set<String>();
        for (Contact c : contacts) {
            if (!String.isBlank(c.Email)) {
                emails.add(c.Email.toLowerCase());
            }
        }

        Map<String, Contact> existingContacts = new Map<String, Contact>();
        for (Contact c : [SELECT Id, Email FROM Contact WHERE Email IN :emails]) {
            existingContacts.put(c.Email.toLowerCase(), c);
        }

        for (Contact c : contacts) {
            if (existingContacts.containsKey(c.Email.toLowerCase())) {
                c.addError('Ya existe un contacto con este email.');
            }
        }
    }

    // --- 3. Asignar valores por defecto ---
    public static void assignDefaultStage(List<Opportunity> opps) {
        for (Opportunity opp : opps) {
            if (String.isBlank(opp.StageName)) {
                opp.StageName = 'Prospecting';
            }
        }
    }

    // --- 4. Validación de campos obligatorios ---
    public static void validateRequiredFields(List<Account> accounts) {
        for (Account acc : accounts) {
            if (String.isBlank(acc.Name)) {
                acc.addError('El campo Nombre es obligatorio.');
            }
        }
    }

    // --- 5. Relacionar registros (Owner de Account al Contacto) ---
    public static void assignAccountOwnerToContacts(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();
        for (Contact c : contacts) {
            if (c.AccountId != null) {
                accountIds.add(c.AccountId);
            }
        }

        Map<Id, Account> accounts = new Map<Id, Account>([
            SELECT Id, OwnerId FROM Account WHERE Id IN :accountIds
        ]);

        for (Contact c : contacts) {
            if (c.AccountId != null && accounts.containsKey(c.AccountId)) {
                c.OwnerId = accounts.get(c.AccountId).OwnerId;
            }
        }
    }
}
