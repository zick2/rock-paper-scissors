<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:template match="/">
        <FileSet>
            <FileSetFiles>
                <FileSetFile>
                    <RelativePath>../../../docs/README-06-Greek.md</RelativePath>
                    <xsl:element name="FileContents" xml:space="default">
                        <xsl:text># </xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text>
Οι έλενες αρχίζουν να κατασκευάζουν το στρατόπεδό τους στην παραλία. Για να αποφασίσουν ποιο σκηνίο θα είναι πιο κοντά στο στρατόπεδο των γλυκιάς, ένα μεγάλο
</xsl:text>
                        <xsl:value-of select="/name"/>
                        <xsl:text xml:space="preserve">-Turnier βρίσκεται ήδη σε εξέλιξη.

</xsl:text>
                        <xsl:value-of select="*/name"/>
                        <xsl:text> είναι ένα παιχνίδι μεταξύ δύο παικτών. Κάθε παιχνίδι αποτελείται από πολλές γύρους, κατά τη διάρκεια κάθε γύρου οι παίκτες επιλέγουν ταυτόχρονα μία από

 
</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="name"/>
                        </xsl:for-each>
                        <xsl:text>&#32; τύπους με μία σχέση χεριού. Στη συνέχεια, ένας νικητής επιλέγεται για αυτό το γύρο.
</xsl:text>
                        <xsl:for-each select="//shapes">
                            <xsl:if test="position() > 1">
                                <xsl:text>,</xsl:text>
                            </xsl:if>
                            <xsl:value-of select="name"/>
                            <xsl:text>&#32; gewinnt gegen </xsl:text>
                            <xsl:value-of select="//shapes[opp_code=current()/wins_against]/name"/>
                        </xsl:for-each>
                        <xsl:text>. Wenn beide Spieler dieselbe Form wählen, endet die Runde unentschieden. </xsl:text>
                        <xsl:apply-templates select="*/rules"/>
                    </xsl:element>
                    <OverwriteMode>Always</OverwriteMode>
                </FileSetFile>
            </FileSetFiles>
        </FileSet>
    </xsl:template>


    <xsl:template match="rules">
        <xsl:text>
</xsl:text>
        <xsl:text>
## Σχηματοποιήσεις και Αποτελέσματα

Υπάρχουν </xsl:text>
        <xsl:value-of select="count(shapes)"/>
        <xsl:text> σχηματοποιήσεις. Αυτές είναι:
</xsl:text>

        <xsl:apply-templates select="shapes"/>
        <xsl:apply-templates select="outcomes"/>
        <xsl:text>&#32;## Οι Κανόνες 

Ως ευγνωμοσύνη για τη βοήθειά σας χθες, ένας Ελύφος σας δίνει μια κρυπτογραφημένη οδηγία στρατηγικής (η ημερομηνία εισαγωγής της παζλ του), η οποία σας περιγράφει πως σας βοηθάει να κερδίσετε. "Η πρώτη στήλη είναι αυτό που θα παίξει ο αντιπάλος σας:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text> </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text> για </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:for-each>
        <xsl:text> και η δεύτερη στήλη είναι αυτό που θα πρέπει να παίξετε στην απάντηση:</xsl:text>
        <xsl:for-each select="//shapes">
            <xsl:text> </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text> για  </xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
        </xsl:for-each>
        <xsl:text> Να κερδίζετε πάντα θα ήταν επιστημονικώς πειστικό, γι' αυτό πρέπει οι απαντήσεις να επιλεγούν προσεκτικά.

Ο νικητής του συνολικού του αγώνα είναι ο παίκτης με τον υψηλότερο σκορ. Το συνολικό σου σκορ είναι η άθροιση των σκορ σε κάθε γύρο. Το σκορ ενός μόνου γύρου είναι το σκορ της επιλεγμένης μορφής (</xsl:text>
        <xsl:for-each select="shapes">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name"/>
            <xsl:text> = </xsl:text>
            <xsl:value-of select="score"/>
        </xsl:for-each>
        <xsl:text>) συν το σκορ του αποτελέσματος του γύρου (</xsl:text>
        <xsl:for-each select="outcomes/*">
            <xsl:if test="position() > 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:value-of select="name()"/>
            <xsl:text>&#32;=&#32;</xsl:text>
            <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>).

Δεν μπορείς να είσαι σίγουρος αν ο έλφις προσπαθεί να σε βοηθήσει ή να σε παραπλανήσει, γι' αυτό πρέπει να υπολογίσεις το σκορ που θα έπαιρνες, αν ακολουθούσες την οδηγία στρατηγικής.

</xsl:text>
        <xsl:apply-templates select="games"/>
    </xsl:template>

    <xsl:template match="shapes">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> (Κώδικας αντιπάλου: `</xsl:text>
        <xsl:value-of select="opp_code"/>
        <xsl:text>`, Κώδικας παίκτη: `</xsl:text>
        <xsl:value-of select="player_code"/>
        <xsl:text>`, νικάει εναντίον: `</xsl:text>
        <xsl:value-of select="//shapes[opp_code = current()/wins_against]/name"/>
        <xsl:text>`, Σκορ: </xsl:text>
        <xsl:value-of select="score"/>
        <xsl:text>), </xsl:text>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>


    <xsl:template match="outcomes">
        <xsl:text>
## Οι αξιολογήσεις αποτελεσμάτων είναι:: </xsl:text>
        <xsl:text>
- Νίκη: </xsl:text>
        <xsl:value-of select="win"/>
        <xsl:text>
- Ήττα: </xsl:text>
        <xsl:value-of select="loss"/>
        <xsl:text>
- Ισοπαλία: </xsl:text>
        <xsl:value-of select="draw"/>
        <xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>

    <xsl:template match="games">
        <xsl:text>&#10;### </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text>
Δεν μπορείτε να είστε σίγουροι αν ο ξενέλας προσπαθεί να σας βοηθήσει ή να σας απατήσει, γι' αυτό πρέπει να υπολογίσετε τη βαθμολογία που θα πάρετε αν ακολουθήσετε τη κατευθυντική γραμμή στρατηγικής.

Για παράδειγμα, υποθέτουμε πως σας δόθηκε η παρακάτω κατευθυντική γραμμή στρατηγικής:



</xsl:text>
        <xsl:text>```
</xsl:text>
        <xsl:for-each select="//rounds">
            <xsl:value-of select="opp_code"/>
            <xsl:text>&#32;</xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>```
</xsl:text>
<xsl:text>Αυτή η κατευθυντική γραμμή στρατηγικής προγνωστεί και συστήνει τα εξής:

</xsl:text>
        <xsl:for-each select="rounds">
            <xsl:text>- Ο αντιπάλος επέλεξε </xsl:text>
            <xsl:value-of select="//shapes[opp_code=current()/opp_code]/name"/>
            <xsl:text> (Κώδικας </xsl:text>
            <xsl:value-of select="opp_code"/>
            <xsl:text>), ο παίκτης επέλεξε </xsl:text>
            <xsl:value-of select="//shapes[player_code=current()/player_code]/name"/>
            <xsl:text> (Κώδικας </xsl:text>
            <xsl:value-of select="player_code"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>Η γύρα ήταν μια </xsl:text>
            <xsl:value-of select="result"/>
            <xsl:text>, με βαθμολογία </xsl:text>
            <xsl:value-of select="score"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:text>      Βαθμολογία επιλογής: </xsl:text>
            <xsl:value-of select="choice_score"/>
            <xsl:text>, Βαθμολογία αποτελέσματος: </xsl:text>
            <xsl:value-of select="outcome_score"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        <xsl:text>Η τελική βαθμολογία είναι: </xsl:text>
        <xsl:value-of select="sum(//games/rounds/score)"/>
        <xsl:text>&#10;</xsl:text>
    </xsl:template>

</xsl:stylesheet>