## Enigma

### Aticle's Author

Arkadiusz Orłowski
Institute of Physics, Polish Academy of Sciences,
Warsaw, Poland
Department of Informatics, WULS - SGGW, Warsaw,
Poland

### Definition

Enigma [Gr. αίνιγμα] is a common name for a family of rotor-based
electromechanical crypto machines, playing enormous role in providing
security of radio communication for various German military units during the Second World War.

### Background
#### From creation to patent

The first Enigma, designed by Arthur Scherbius (patent DE416219 filed 23. 02. 1918),
after rejection from German Navy and Foreign Office, was targeted at international business community.

After 1923, four versions of commercial Enigma successively appeared.
Models A and B, equipped with a typewriter, were quite huge (65x45x35 cm)
and heavy (about 50 kg).

Models C (short-lived) and D were smaller, with a lampboard (Ger. *Lampenbrett*)
instead of a typewriter, and a reflector (Ger. *Umkehrwalze*)
invented by Willi Korn (patent DE460457 filed 11. 03. 1926).

Such a reflector ensured self-reciprocity of Enigma 
(the same machine could be used for encryption and decryption of a message)
and has become a hallmark of all subsequent versions.

Similar designs were patented independently about the same time by
Hugo Alexander Koch (patent NL10700 filed 07. 10. 1919),
Arvid Gerhard Damm (patent SW52279 filed 10. 10. 1919), 
and Edward Hugh Hebern (patent US1510441 filed 31. 03. 1921).

In 1922, patent rights for Koch's *geheimschrijfmachine* were transferred to 
Naamloze Vennootschap Ingenieursbureau Securitas,
and in 1927, resold (for 600 Dutch guilders) to *Chiffriermaschinen Aktien Gesellschaft,*
a company co-founded by Scherbius in 1923.

#### Use of Enigma by army

German Navy started to experiment with Enigma in 1926 (*Funkschlussel* C).
German Army introduced its version of Enigma (based on Enigma D) in 1928.
A mature version named Enigma I was ready by 1932.

Novel very important part of military Enigma was a plugboard
(Ger. *Steckerbrett*) that significantly increased the number of its possible settings.

German Navy adapted Enigma I in 1934
(*Funkschlussel* M or M1, evolving up to M4,
introduced in February 1942 for *U-boot* communication).

From mid-1930s, Enigma became universally used in all German armed forces
(Air Forces introduced Enigma I in 1935;
Military Intelligence started to regularly use a different G model of Enigma around 1936)
and most military-related services.

Estimated total number of various Enigma machines used in the period 1935-1945 is of the order of 100,000.

#### External aspect

A typical military Enigma was a portable electromechanical machine equipped with a battery.
It had dimensions and looks of a typical typewriter (size of 28x34x15 cm, weight about 12 kg).
A keyboard included only 26 characters of the Latin alphabet.

Conventions for digits, punctuation signs, and other special characters were elaborated
(e.g. numbers were often spelled out).

A partly transparent panel marked with the same set of 26 Latin letters
was covering 26 bulbs of the type used in flashlights.

#### Description of cipher system

Elements responsible for encryption consisted of:
variable-position rotors (Ger. *Walzen),
one reflector,
one fixed entry plate (Ger. *Eintrittwalze),* 
and the plugboard.

Inside military Enigma, three rotors, selected from a larger set, could be accommodated.

Till December 15, 1938, the Army used only first three of five differently
wired rotors supplied (numbered I, II, III, IV, and V, respectively).

The Navy used all rotors from the very beginning and successively increased
the number of available types of rotors: first to seven and eventually to eight.

Each rotor had 26 fixed contacts on one side, and 26 spring-loaded contacts
on the other side, both sides being internally connected in an irregular fashion.

Each rotor was equipped with a ring with 26 letters of the alphabet (or numbers from 01 to 26)
engraved on its circumference.

The ring could be fixed at 26 different positions with respect to the core of the rotor.
The top letters of the rings were visible through small windows located in a metal lid of Enigma.

The reflector, placed to the left of the variable-position rotors,
did not move, and had 26 spring-loaded contacts located on its right side.

These contacts were connected among themselves in pairs.
The original reflector UKW A was replaced by UKW B in November 1937.
UKW C appeared in 1940 and was used only occasionally.
UKW D, first detected by Allies in January 1944, had adjustable internal connections.

M4 model had an additional fourth rotor denoted $ \beta $ and called a Greek rotor.

--- 
To fill in the same space, the type-B reflector was made proportionally thinner.
In 1943, another Greek rotor denoted $ \gamma $ , associated with a modified type-C reflector was introduced.
Rotors $ \beta $ and $ \gamma $ did not move during encryption but could be set at any of 26 positions.
To provide a compatibility with the still extensively used M3 model, the thin reflectors with corresponding Greek rotors placed in some special positions were equivalent to the old (B or C) reflectors.
Thinner reflectors had fixed contacts and Greek rotors had spring-loaded contacts on both sides.
The plugboard (also known as a switchboard or a stecker) consisted of 26 pairs of sockets, each pair representing a letter.
Connecting two pairs of sockets together via cross-wired cables had an effect of swapping two letters of the alphabet at the input and at the output of the enciphering transformation.
The entry plate, located to the right of rotors, had 26 fixed contacts connected to the sockets of the plugboard.
When a key of the keyboard was pressed, a current loop was closed and a bulb lit.
Due to reflector properties the flashed letter was always different than the pressed letter.
A special ratchet and pawl mechanism was used to control each rotor motion.
After pressing a key, the right rotor (called a fast rotor) made a 1/26 of the full revolution.
When the right rotor reached a certain position called a turnover position, the middle rotor turned by 1/26 of the full angle.
Finally, when the middle rotor reached its turnover position, then both the middle and the left rotors turned by the same amount.
This way, each subsequent letter was encrypted using a different setting of rotors, and Enigma implemented a polyalphabetic cipher with a reasonably large period.
A single notch on each ring for rotors I-V (associated with different letter on the ring for different type of rotor) determined that rotor turnover position.
Rotors VI-VIII had two symmetrically positioned notches.
Due to a peculiarity of the ratchet-pawl mechanism, the middle rotor could undertake so-called double-stepping.
Thus the period was rather $ 26 * 25 * 26 = 16900 $ than $ 26^{3}=17576 $ .

**Enigma. Fig. 1 ** Three-rotor militaryEnigma machine

Frequency distribution of letters in the cipher text was almost perfectly uniform, and no attacks based on the classical frequency analysis applied to Enigma.

## Theory( of Encryption and Cryptoanalysis )

A daily key, describing how Enigma should be prepared for a given day traffic, consisted of the following elements: (1) Choice and order of three moving rotors (Ger.
Walzenlage).
During the WWII it gave 60 possibilities for Enigma I and 336 possibilities for the naval machines.
For M4 Enigma there was also an additional prescription for which of four combinations of thin reflectors (B or C) and Greek rotors $ (\beta $ or $ \gamma ) $ should be used.
Such a combination usually lasted for the whole month.
(2) Position of a ring with respect to its rotor core (Ger.
*Ringstellung).
* Rings settings on all three rotors placed into Enigma from left to right were provided $ (2 6^{3} $ possibilities).
Greek rotors settings in M4 machine were kept practically fixed.
(3) Plugboard connections (Ger.
*Steckerverbindungen).
* The cross plugging involved firstly six, then eight, and eventually ten pairs of letters.
Thus, the plugboard offered far more possible variations than any other part of the daily key (of the order of $ 1 0^{1 5} $ ).
(4) Initial positions of rotors at the top of Enigma (Ger.
*Grundstellung).
* This was a group of three (or four for M4) letters describing rotors starting positions.
(5) Key identification (Ger.
Kennguppen).
It helped a receiver to identify the key used by the sender but had no direct influence on the Enigma cipher security.

If all messages on a given day had been encrypted
using the same initial setting of Enigma determined by the daily key, frequency analysis applied separately to all first, second, *etc.
* letters of the ciphertexts would have easily broken the code.
This made necessary to use a message key (Ger.
*Spruchschlussel*) composed of three (or 4 for M4) letters and determining rotors position at the beginning of an actual message encryption.
Although message keys were chosen by individual operators themselves, supposedly "at random," a lot of predictable patterns were observed.
For the Army Enigma, until September 15, 1938, a message key was encrypted twice (apparently to detect possible transmission errors) using the daily key.
The obtained six letters were placed in a header of the message.
After that date, each Enigma operator was responsible for choosing initial settings of rotors used for double encryption of message keys.
These positions were then transmitted in clear in the header of the ciphertext, and were not any longer identical for all operators.
On May 10, 1940, the day of attack on France, Germans changed again the key distribution procedure and started to encrypt each message key only once.
Key management procedures of German Navy were always a bit different than those of the Army: usually safer and more elaborate.


In December 1932, Marian Rejewski, a mathematician working for the Polish Cipher Bureau, reconstructed the internal wiring of Enigma I by designing and solving a set of permutation equations describing Enigma operations.
Instrumental to this achievement were: access to doubly encrypted message keys intercepted by Polish radio stations and justified assumption that a significant percentage of them consisted of three identical letters, imaginative guessing with regard to the entry plate permutation, tables of daily keys for two consecutive months (September and October of 1932) supplied by Gustave Bertand (chief of radio intelligence section of French Intelligence Service) and obtained from paid agent Hans-Thilo Schmidt, pseudonym Asche, working as a civil servant in the cryptographic department of the German Army.


Later on, several effective procedures for systematic reconstruction of daily keys by Marian Rejewski, Jerzy Różycki, and Henryk Zygalski were developed.
A grill method was used in the period 1933-1936.
It required enciphered message keys, belonging to about 70-80 intercepted Enigma ciphertexts.
Bad habits of Enigma operators regarding the choice of three letters as the message keys were essential.
When a possibility of choosing message keys composed of three identical letters or letters that appeared on three neighboring positions of the Enigma keyboard was forbidden by German procedures, operators subconsciously avoided any message keys in which only two letters repeated.
Such a small statistical bias, combined with the knowledge of the theory of permutations,

appeared to be sufficient to reconstruct the permutations needed, as well as all individual message keys for a given day.
To determine which rotor was placed on the rightmost position, Rózycki's "clock method" was used.
It relied on the property of Enigma that the position of the rightmost rotor at which the middle rotor moved was different for each of the three rotors used by German Army.
The main part of the grill method was devoted to the reconstruction of the connections of the plugboard.
The fact that the plugboard did not change all letters was utilized.
The choice, order, and positions of the middle and left rotor were found using an exhaustive search involving 1,352 trials.
Finally, the location of the rotor rings was determined using an "ANX" method, based on the observation that majority of German messages started from the letters "AN" followed by "X" (used instead of space).
A method of characteristics, used in the period 1936-1938, relied on the fact that a format of products of some permutations (meaning the length of cycles in the representation of a permutation in the form of a product of disjoint cycles) depended on the order and the exact settings of rotors, but did not depend on the plugboard connections.
The pattern of cycle lengths was extremely characteristic for each daily key.
As there were 1030301 different cycle patterns ("characteristics") and 105456 possible arrangements (orders and settings) of three rotors, it was quite likely that a given "characteristic" corresponded either to a unique arrangement of rotors or at most to a small number of arrangements that could easily be tested.
With known positions of rotors, the plugboard connections could be determined relatively easily, and the "ANX" known-plaintext attack method was still used to get the ring settings.
To create a catalog of characteristics an electromechanical device called cyclometer was constructed.
As after September 1938 most of the previous methods lost their significance, to determine the correct positions of rotors a "Bomba," an aggregate of six Enigma machines operating in concert, was designed by Rejewski and built up in November 1938 by Polish AVA Radio Manufacturing Company.
Another method of "Zygalski's perforated sheets" was developed around the same time, utilizing the fact that out of all possible rotor settings, only $ 40 \% $ led to the product of some permutations that included at least one pair of one-letter cycles.
On July 24-26, 1939, during a meeting in Pyry in the Kabacki Wood just outside Warsaw, Polish passed two copies of the reconstructed Enigma machine to French and British, respectively.
Also the detailed documentation of Zygalski's sheets, Polish "Bomby," and other Polish methods were discussed and transferred.

In the summer of 1939, Britain's Government Code and Cypher School (GC&CS) moved from London to a


Victorian manor in Bletchley, northwest of London, called Bletchley Park.
It continuously grew, from about 30 up to the level of about 10,000 employees.
Initially, British adapted Polish methods - by the end of 1939 they managed to fabricate all 60 sets of Zygalski's sheets needed, and used this method together with Polish team working at that time in France.
After May 10, 1940, British cryptologists managed to come up with some impromptu methods, relying on bad habits of a few Enigma operators (some of committed errors were explicitly forbidden by German procedures) and included so-called Herivel tips and cillies (e.
g.
, the same triple of letters was used for both: an initial position of rotors, sent in clear, and for a message key, sent in encrypted form).
But the major breakthrough was development of the British "Bombe.
" It was based not on the evolving key distribution procedures, but on so-called cribs (fragments of plaintext that were possible to guess) allowing a known-plaintext attack.
The sources of these cribs were numerous (e.
g.
, data about senders and receivers with titles and affiliations, formal greetings, stereotypical reports such as having nothing to report, easily predictable weather forecasts, or the same messages retransmitted between networks using different daily keys).
The idea of the British "Bombe" came from Alan Turing, and a significant improvement, called a "diagonal board" was proposed by Gordon Welchman.
The goal was to find positions of rotors that could not be excluded as possibly being used at the start of encryption.
Each "Bombe" contained 12 sets of three rotors each, and was working synchronously through all possible rotor positions.
"Bombes" were operated by members of the Women's Royal Naval Service, "Wrens," who were responsible for initializing machines, writing down rotor combinations found by the machine, and restarting machines after each potentially correct combination was discovered.
The "Bombes" working time could be reduced by first applying another Turing invention - a method called "Banburismus.
" To effectively use the "Banburismus" many messages had to be intercepted (of the order of 300) and it could be applied to a three-rotor Enigma only.
Approximately 210 "Bombes," that started to appear in 1940, were built and used in England throughout the war.
To support British effort, in summer 1942, US Navy assigned the design of American "Bombes" to Joseph Desch, the research director of the National Cash Register Company (NCR) based in Dayton, Ohio.
In May 1943, the first two American "Bombes" were successfully tested.
About 120 American "Bombes" were produced, being faster and more suitable to break M4 Enigma.
They were operated by women in the US Navy, called "Waves" from "Women Accepted for Volunteer Emergency Service.
"

### RecommendedReading

1.
Kozaczuk W (1984) Enigma: How the German machine cipher was broken, and how it was read by the allies in World War Two.
Arms and Armour Press, London

2.
Kahn D (1996) The codebreakers: the comprehensive history of secret communication from ancient times to the Internet, 2nd ed.
Scribner, New York

3.
Welchman G (1997) The hut six story: breaking the Enigma codes, revised edition.
M & M Baldwin, Kidderminster

4.
Bauer FL (2010) Decrypted secrets: methods and maxims of cryptology, 4th ed.
Springer, Berlin

5.
Sebag-Montefiore H (2000) Enigma: the battle for the code.
Weidenfeld & Nicolson, London

6.
Gaj K, Orlowski A (2003) Facts and Myths of Enigma: Breaking Stereotypes.
In: Biham E (ed) Advances in Cryptology - EUROCRYPT 2003.
LNCS 2656, Springer, Berlin, pp 106-122
