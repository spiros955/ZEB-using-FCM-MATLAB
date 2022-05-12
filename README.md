# ΠΕΡΙΓΡΑΦΗ 

Μοντελοποίηση της λειτουργίας ενός κτιρίου μηδενικού  ενεργειακού ισοζυγίου με τη χρήση ασαφών γνωστικών δικτύων (Fuzzy Cognitive Maps) σε MATLAB. Μελέτη της ενεργειακής ισορροπίας του συστήματος για δύο διαφορετικές περιόδους λειτουργίας κατά τη χειμερινή και θερινή περίοδο.

# ΚΤΙΡΙΟ ΜΗΔΕΝΙΚΟΥ ΕΝΕΡΓΕΙΑΚΟΥ ΙΣΟΖΥΓΙΟΥ - ZERO ENERGY BUILDING (ZEB)

Ένα κτίριο μηδενικού ενεργειακού ισοζυγίου έχει τη δυνατότητα να εξασφαλίζει την ενέργεια που χρειάζεται να καταναλώσει κατά τη διάρκεια ενός ολόκληρου έτους, μέσα από ανανεώσιμες πηγές. Εξακολουθεί να είναι ένα κτίριο συνδεδεμένο στο δίκτυο, παρέχοντας ενέργεια όταν έχει αποθέματα και αντλώντας ενέργεια από αυτό όταν οι ανάγκες  για κατανάλωση  είναι μεγαλύτερες από αυτές που τα συστήματά του μπορούν να παράγουν. 

# ΑΣΑΦΗ ΓΝΩΣΤΙΚΑ ΔΙΚΤΥΑ - FUZZY COGNITIVE MAPS (FCM)

Τα Ασαφή Γνωστικά Δίκτυα (ΑΓΔ) προήλθαν ως συνδυασμός των μεθόδων της ασαφούς λογικής και των νευρωνικών δικτύων. Συνιστούν μία μέθοδο μοντελοποίησης που αποτελείται από ένα πλέγμα συνδεδεμένων και αλληλοεξαρτώμενων κόμβων C<sub>i</sub> (μεταβλητές), καθώς και από τις σχέσεις που υπάρχουν μεταξύ τους W (βάρη). Κάθε κόμβος αναπαριστά ένα βασικό χαρακτηριστικό του συστήματος. Κάθε διασύνδεση μεταξύ των κόμβων αντιπροσωπεύει μία σχέση αιτίου-αποτελέσματος που υφίσταται μεταξύ των εννοιών αυτών και καθορίζει το βαθμό και τον τρόπο, με τον οποίο η μία επηρεάζει τη διαμόρφωση της τιμής της άλλης. Oι κόμβοι παίρνουν τιμές μεταξύ [0,1] και τα βάρη των διασυνδέσεων βρίσκονται στο διάστημα [-1,1].

 ## ΠΙΝΑΚΑΣ ΒΑΡΩΝ W<sub>ij</sub>

![image](https://user-images.githubusercontent.com/59124127/168047549-f8fe8f6a-cd1d-4906-8177-1573c4787eed.png)


## Κόμβοι: 


- C1: Φωτοβολταϊκό Σύστημα   
- C2: Ανεμογεννήτρια 
- C3: Φωτισμός 
- C4: Ηλεκτρικές/ Ηλεκτρονικές Συσκευές 
- C5: Κλιματισμός 
- C6: Ηλιακή Ακτινοβολία 
- C7: Ταχύτητα του Αέρα
- C8: Παράθυρα 
- C9: Φυσικό φως 
- C10: Σκίαση 
- C11: Εσωτερική Θερμοκρασία 
- C12: Εξωτερική Θερμοκρασία
- C13: Γεωθερμία
- C14: Συνολική Παραγωγή  
- C15: Συνολική Κατανάλωση


_Concept εισόδου_: Δεν επηρεάζονται από άλλα concept αλλά επηρεάζουν τα concept
κατάστασης και εξόδου. Είσοδοι : C4,C6,C7,C12,C13

_Concept κατάστασης_: Επηρεάζονται από τα concept εισόδου και απο άλλα concept κατάστασης και επηρεάζουν τα concept εξόδου. Καταστάσεις : C1,C2,C3,C5,C8,C9,C10,C11

_Concept εξόδου_: Προκύπτουν από το συνδυασμό των παραπάνω. Έξοδοι : C14,C15

## ΑΣΑΦΕΣ ΓΝΩΣΤΙΚΟ ΔΙΚΤΥΟ ΤΟΥ ΣΥΣΤΗΜΑΤΟΣ

![image](https://user-images.githubusercontent.com/59124127/168053445-ee4c3e8f-c8aa-41af-8121-7a9256f9b37b.png)

# ΠΕΡΙΠΤΩΣΗ 1 - ΧΕΙΜΕΡΙΝΗ ΗΜΕΡΑ

Μια χειμωνιάτικη μέρα υπάρχει χαμηλή ηλιακή ακτινοβολία (0.2), ο άνεμος που φυσάει είναι 
μέτριος (0.6) και η εξωτερική θερμοκρασία πολύ χαμηλή (0.1). Οι ένοικοι του κτιρίου κάνουν 
υψηλή χρήση των ηλεκτρικών και ηλεκτρονικών συσκευών του σπιτιού (0.9). Τέλος στην 
περιοχή υπάρχει έντονη γεωθερμική δραστηριότητα (0.8).

Προκύπτει ότι η τιμή του κόμβου C15 (0,507) είναι μεγαλύτερη του κόμβου C14 (0,414), δηλαδή η συνολική κατανάλωση ενέργειας για μια χειμωνιάτικη ημέρα υπερβαίνει τη συνολική παραγωγή. 

Στη συνέχεια μεταβάλουμε τον πίνακα βαρών ώστε να περιγράφει τη λειτουργία του κτιρίου κατά τους καλοκαιρινούς μήνες (π.χ. καθώς το φυσικό φως κατά τους καλοκαιρινούς μήνες αυξάνεται, η ανάγκη για φωτισμό μειώνεται. Συνεπώς θα μεταβάλουμε το W<sub>93</sub> από -0.3 σε -0.6).

# ΠΕΡΙΠΤΩΣΗ 2 - ΚΑΛΟΚΑΙΡΙΝΗ ΗΜΕΡΑ

Μια καλοκαιρινή ημέρα υπάρχει υψηλή ηλιακή ακτινοβολία (0.8), ο άνεμος που φυσάει είναι 
μέτριος (0.5) και η εξωτερική θερμοκρασία πολύ υψηλή(0.8). Οι ένοικοι του κτιρίου κάνουν 
υψηλή χρήση των ηλεκτρικών και ηλεκτρονικών συσκευών του σπιτιού (0.9). Τέλος στην 
περιοχή υπάρχει έντονη γεωθερμική δραστηριότητα (0.8).

Η συνολική παραγωγή ενέργειας (0.845) υπερβαίνει τη συνολική κατανάλωση (0.573)

# ΣΥΜΠΕΡΑΣΜΑΤΑ

Συγκρίνοντας τα αποτελέσματα των δύο ημερών προκύπτει ότι κατά την χειμερινή περίοδο η συνολική παραγωγή ενέργειας του κτιρίου δεν επαρκεί για να καλύψει τις ανάγκες των κατοίκων του και είναι απαραίτητη η παροχή συμπληρωματικής ενέργειας από το δίκτυο. Αντιθέτως, κατά την καλοκαιρινή περίοδο, παρότι η κατανάλωση ενέργειας είναι ελαφρώς μεγαλύτερη συγκριτικά με την χειμερινή περίοδο, αυξάνεται σημαντικά η συνολική παραγόμενη ενέργεια του κτιρίου και επαρκεί πλήρως για την κάλυψη των ενεργειακών του αναγκών. 
