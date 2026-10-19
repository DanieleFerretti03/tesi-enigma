# CMSC 28400 Introduction to Cryptography Autumn 2019
# Instructor: David Cash

# Contents
2.1The Simplied Enigma Machine 1
    2.1.1 Message Keys and Rejewski’s Attack

2.2Permutations and Cycle Decompositions 
    2.2.1 Cycles in Permutations
    2.2.2 Conjugates of Permutations

2.3Application to Enigma: Rejewski’s Theorem 
    2.3.1 Permutation Structure of the Initial Setting
    2.3.2 The Eect of a Rotor Rotation
    2.3.3 The Types of $\Delta_{i}$ 

2.4Rejewski’s Theorem and Attack 
    2.4.1 Step One: Learning $\Delta_4$ $\Delta_1$ $\Delta_5$ $\Delta_2$ and $\Delta_6$ $\Delta_3$
    2.4.2 Step Two: $\Delta_4$ $\Delta_1$ $\Delta_5$ $\Delta_2$ and $\Delta_6$ $\Delta_3$
    2.4.3 Step Three: Identifying1*;*2, 
    2.4.4 Proof of Rejewski’s Theorem 

---

These notes cover the permutation-based attack of Rejewski against the early Enigma machines,
along with some mathematical background used in the attack.


2. 1 The Simplied Enigma Machine 

We will study a somewhat simplied version of the Enigma machine used in early 1930s.
In Figure 2. 1 two versions of the Enigma are pictured.
The relevant parts of the machine are a keyboard, a light-board, a plug-board,
and a rotor assembly consisting of three rotors along with a special *reector* (not visible).
The rotors are electrical implementations of a substitution cipher on
$\sum = \{A ... Z\}$.
They have 26 connections (with labels) on each side, and in between is a mess of wires
that physically permutes how they are connected.
The rotors are designed to be chained together, and also so that they can rotate
to change how their 26 connections line up.
The rotors are also designed so their their rotational position is externally visible
after they are placed in the machine, and they can be manually rotated in discrete
$\frac{1}{26^{th}}$ steps.
An Enigma user would actually have several rotors stored in a box,
but only three would be used at a time 
(in this version; other rotor-based ciphers and later Enigmas had more than three rotors).


To operate these machines, one would start by conguring the machine according
to the *day* *key* which were distributed to everyone in order for them to communicate.
These settings included which rotors to use, how to align them with respect
to the rest of the machine, which connections to make on the plugboard,
as well as something called the *ring setting* that we will ignore.

Once congured, the operation is simple: To encipher a letter one presses a key on the keyboard.
A electric signal passes from the keyboard through the plugboard,
three rotors, the reector, and then through the rotors again and the plugboard again
before lighting up a letter on the lightboard, which is the enciphered letter.

We note that the reector is always wired to avoid ever mapping a letter to itself.

The force of pressing the key would also rotate the rotors.
The right-most "first" rotor will always rotate, and the other two rotors will rotate
on a schedule depending on the positioning of a physical catch between the rotors.
In these notes, we’ll work under the assumption that only the first rotor moves.

The effect of a rotating on the electrical connections is diagramed in the bottom of Figure 2.
2.

## 2. 1. 1 Message Keys and Rejewski’s Attack

It was recognized that if everyone were to set their Enigma to same day key
and then encipher messages, than basic frequency analysis would defeat the encryption
(since the same permutation would be applied to *i* th letter by everyone).

In the early usage of the Enigma, this was mitigated by using *message keys*.
The sender would choose a random three-letter message key *xyz*.
The sender would then begin the transmission by enciphering the letters *xyz twice*.

After this, the sender would manually rotate the rotors to positions *x;y;z*,
and then encipher the payload of the message as before.


### Example 2. 1.
*Suppose the sender chooses message key* TAQ*.
The sender enciphers the messages* *twice using the day key; Suppose this produces the six letters* ICPWLV*.
The sender then resets the* *three rotors to positions* T*,*A*, and* Q*, and then enciphers the rest of the message.
*

The idea was that message keys would provide enough randomization to defeat frequency analysis.
However, it did not work against more clever attacks.
Specically, we will show that given many ciphertexts (about fty in practice), 
a clever attack easily recovers all of the message keys!
Thus if one know the day keys (say by stealing them), then all messages can be decrypted.

# 2. 2 Permutations and Cycle Decompositions

Our rst order of business will be to give a clear and useful mathematical description of an Enigma machine.
The most useful language for doing so turns out to be *permutations*,
which we turn to in the next section before returning to the attack later.


#### Definition 2. 1. A permutation on a set is a one-to-one and onto function from to itself.

Recall that *one-to-one* means that $x \neq y$ implies , $\pi(x) \neq \pi(y)$
and *onto* means that for every $y \in \sum$ there exists $x \in \sum$
such that $\pi(x) = y$.
Here are two examples of permutations on the set $\sum = \{1,2,3,4,5,6\}$.
They are presented in "table form", so given *x* we can simply look up $\pi(x)$.

x -- $\pi(x)$
1 -- 4
2 -- 1
3 -- 6
4 -- 5
5 -- 2
6 -- 3

x -- $\sigma(x)$
1 -- 2
2 -- 1
3 -- 5
4 -- 4
5 -- 6
6 -- 3

## 2. 2. 1 Cycles in Permutations

The table setting is intuitive, but the real structure of permutations is revealed if we use them to create a graph, as follows.
Let be a permutation on, and dene a directed graph *G* = (*V;E*) with vertex set *V* = and an edge from each *x 2* to (*x*).

What these graphs have in common is that every node is a member of exactly one directed cycle 
(which may be a self loop).

Indeed this will be true for *any* permutation on a nite set: Start from any node and iteratively apply the permutation to walk on nodes.
Since the set is nite, you must eventually repeat a node.
Since the permutation is one-to-one, the rst repetition must bring you back to where you started.
Starting at another node not on this cycle will generate yet another cycle, and so on.
The upshot is: *There is a one-to-one correspondence between permutations on* *and graphs that consist of a covering of all of with directed cycles*.
This structure motivates the following notation:

#### Denition 2. 2.
We write $(a_1, a_2, ... a_t)$, where all of the $a_i \in \Sigma$,
for the permutation on $\Sigma$ that maps:
- $a_1 \to a_2$
- $a_2 \to a_3$
- ...
- $a_t \to a_1$
and the rest of the $x \in \Sigma$:
- $x \to x$

We use this notation combined with our product notation.
So for example = (1 4 5 2)(3 6) is another way of writing from above, which can be checked by hand
(and of course, the notation still means that we apply the permutation (3 6) first,
and then permutation (1 4 5 2).


#### Theorem 1.
Every permutation on a finite set $\Sigma$ can be written as a product 
of disjoint cycles.
Moreover, this product is unique up to ordering the cycles
and rotating elements within cycles.

We will not prove this theorem.

#### Denition 2. 3.
Let $\pi$ be  a permutation on $\Sigma$.

(*ADATTAMENTO*)

Per indicare i cicili di un insieme di permutazioni possiamo usare
una notazione piu' corta.
Indichiamo come base la lunghezza del ciclo e l'esponente rappresenta
quante volte compare quel tipo di ciclo.

#### Example 2. 2.
*Let* $\Sigma = \{1,2,3,4,5,6}$:

*The permutation* (1 2)(3 4)(5 6) *has type* $\{2^3\}$.
(Ci sono 3 cicli di lunghezza due)

*The permutation* (1 2 3 4) *has type* $\{1^2 4^1\}$.
(C'e' un ciclo di lunghezza 4, e due di lunghezza 1)

*The permutation* (1 4 3)(5 6) *has type* $\{1^1 2^1 3^1\}$.


## 2. 2. 2 Conjugates of Permutations
The structure of the Enigma machine can be simplied by introducing the concept of *conjugates* of permutations.

#### Definition 2. 4.
Let $\pi$ and $\sigma$ be permutations on $\Sigma$.
The conjugate of $\sigma$ by $\pi$ is defined to be the permutation $\pi \sigma \pi^{-1}$.

#### Theorem 2.
Let have cycle decomposition $(a_1 a_2 ...) (b_1 b_2 ...) ...$.
Then the conjugate $\pi \sigma \pi^{-1}$ has cycle decomposition:
$(\pi(a_1) \pi(a_2) ...) (\pi(b_1) \pi(b_2) ...) ...$

In other words, conjugation by $\pi$ acts on the cycle decomposition of $\sigma$ 
by applying $\pi$ the elements of the cycles.

(CONSIDERAZIONE)
Questo teorema ci consente di definire di cambiare etichette mantenendo la stessa
struttura del grafo.

#### Corollary 1.
A permutation has the same type as any of its conjugates.
This relationship is actually if-and-only-if: If two permutations have the same type, then they are conjugates.


# 2. 3 Application to Enigma: Rejewski’s Theorem
Now let’s apply all of this to analyze an Enigma machine.

## 2. 3. 1 Permutation Structure of the Initial Setting

Suppose that the permutation computed by an Enigma machine in that initial conguration is:

$\Delta_1 = \alpha_1^{-1}  \alpha_2^{-1}  \alpha_3^{-1} \rho\alpha_3\alpha_2\alpha_1$

where $\alpha_i$ ($i \in \{1,2,3\}$) refer to rotors.

This looks complicated, but it becomes simpler if we let $\tau = \alpha_3\alpha_2\alpha_1$.
be the effect of the three rotors going right-to-left.

Then: 
$\Delta_1 = \tau^{-1} \rho \tau$

so $\Delta_1$ the conjugate of $\rho$ by $\tau^{-1}$
(it’s by $\tau^{-1}. and not $\tau$ because the inverse appears on the left side instead of the right).

## 2. 3. 2 The Eect of a Rotor Rotation

You can visually see the effect of rotating the left rotor by looking at 
difference between the top and bottom of Figure 2.2.
We now describe this in terms of permutations.
Let $\Delta_1$ be as above, and let $\Delta_2$ be the permutation
computed after rotating the left rotor (only).

If we let 1be the permutation computed by the1rotor after a rotation, then

$\Delta_2 = \widehat{\alpha_1}^{-1}  \alpha_2^{-1}  \alpha_3^{-1} \rho\alpha_3\alpha_2\widehat{\alpha_1}$

that is, the same as $\Delta_1$ but with $\widehat{\alpha_1}$ instead of $\alpha_1$.

Again $\Delta_2$ is a conjugate of $\rho$, and we only need to understand $\widehat{\alpha_1}$.

Let $\sigma$ be the shift-forward permutation, defined by
$\sigma(A) = B, ... , \sigma(Z) = A$.

It is intuitive that the expression for $\widehat{\alpha_1}$ should involve $\sigma$,
but it might not be immediately clear exactly how.

In Figure 2. 3, and example $\widehat{\alpha_1}$ is diagrammed along with how to produce $\widehat{\alpha_1}$ from $\sigma$.
The key is that rotation is equivalent to keeping $\alpha_1$ fixed but *conjugating* it by $\sigma^{-1}$.

You can check that the two sides of Figure 2. 3 compute the same permutation.
Intuitively, rotation is conjugating because the action on one side of the rotor
(moving forward in the alphabet) induces the opposite action
(moving backward in the alphabet) on the other side of the rotor.

But if that doesn’t make sense, perhaps the diagram is convincing.

We can continue with this thinking to $\Delta_i$, the permutation computed on the *i* th step.
We get

$\Delta_i = \sigma^{-i}\alpha_1^{-1}  \alpha_2^{-1}  \alpha_3^{-1} \rho \alpha_3\alpha_2 \sigma^{-i} \alpha_1 \sigma^{i}$

which is just a nasty-looking conjugate of, but a conjugate nonetheless.
Note that we have cut through a very complicated-looking machine and at least reduced it to a few equations.


## 2. 3. 3 The Types of $\Delta_i$

The next key observation in understanding the behavior of an Enigma machine is that, at any given time, 
the machine will compute a permutation on the letters that has a specic type, namely $\{2^13\}$.

In other words, the permutation computed will always be the product of 13 disjoint cycles of length 2.
This will follow easily from the results of the previous section,
plus the observation that the reector is wired to never map a letter to itself.

We generalize the type of permutation under consideration to any even size alphabet.

#### Denition 2. 5.
Let $|\Sigma|$ be even. A permutation on $\Sigma$ is called a reflector if it has type $\{2^{n/2}\}$.

These permutations are more commonly called *proper involutions*.
(A *(non-proper) involution* is a permutation with 
cycle decomposition consisting of cycles of length of 1 or 2)

#### Lemma 1.
Let $|\Sigma|$ be even and $\rho$ a reflector on $\Sigma$. The the following hold:

1. $\rho^{-1} = \rho$
2. $\forall x \in \Sigma, \rho(x) \neq x$

#### Lemma 2.
Let $\Delta_i$ be the permutation computed by the simplied Engima machine at step i,
as defined in Equation (2.1). Then $\Delta_i$ is a reector.

# 2. 4 Rejewski’s Theorem and Attack

Rejewski’s attack assumes it is given several ciphertexts generated with message keys chosen by senders;
It will recover those message keys with only a little effort.
In fact, the attack is ecient enough to do by hand! The attack proceeds in three steps:

1.
Use the ciphertexts to compute the entire tables (or cycle decomposition) of the permutations
$\Delta_4$ $\Delta_1$, $\Delta_5$ $\Delta_2$ and $\Delta_6$ $\Delta_3$


2.
Find all possible factorizations of
$\Delta_4$ $\Delta_1$, $\Delta_5$ $\Delta_2$ and $\Delta_6$ $\Delta_3$
into products of two reectors.

3.
From amongst the possible factorizations, gure out which ones are the correct ones,
and hence learn $\Delta_1, \Delta_2, \Delta_3$
Now message keys can be recovered.

## 2. 4. 1 Step One: Learning $\Delta_4$ $\Delta_1$, $\Delta_5$ $\Delta_2$ and $\Delta_6$ $\Delta_3$

This step is based on the following lemma:

#### Lemma 3.
Let $\rho_1$ and $\rho_2$ be reectors on $\Sigma$.
Then for $x \in \Sigma$, if 
$\rho_1(x) = y_1$,
$\rho_2(x) = y_2$,
then
$\rho_2\rho_1(y_1) = y_2$,

Here is an example of how it is used against a single ciphertext:

#### Example 2. 3.
Suppose we observe a ciphertext starting with ICPWLV.

We know that there exist $x,y, z \in \Sigma$ such that:
ICPWLV = $\Delta_1(x) \Delta_2(y) \Delta_3(z)\Delta_4(x) \Delta_5(y) \Delta_3(z)$,

where the $\Delta_i$ are unknown permutations computed by the Enigma machine.

We do however know that they are all reectors, by Lemma 2.
Applying Lemma 3, we can infer that:

$\Delta_4 \Delta_1(I) = W$
$\Delta_5 \Delta_2(C) = L$
$\Delta_6 \Delta_3(P) = V$

To learn all $\Delta_i$, the Polish team would look over many ciphertexts.
Each ciphertext would tell them how one letter is mapped in each of the products;
After enough time, they would typically see how all of the letters are mapped by each product.
This completes step one.

## 2. 4. 2 Step Two: Factoring

Now we assume we know the products, and want to recover the individual*i*.
Rejewski based this step on the following theorem:

Theorem 3 (Rejewski).
*Let*1*and*2*be reectors on.
Then if* (*a₁ a₂ at*) *appears in the* *cycle decomposition of their product*2 1*, the cycle*

(1(*at*)1(*at* 1)1(*a₁*))

*also appears in the cycle decomposition of*2 1*, and moreover this cycle is distinct from* (*a₁ a₂ at*)*.
*

We will prove this theorem in the last section.
For now we state an interesting corollary and then show how to apply the theorem.


Corollary 2.
*Let*1*and*2*be reectors, and let* [1 *z* 1 2 *z* 2*nzn*] *be the type of their product* 2 1*.
* *Then all of the ziare even.
*

This lemma is applied once one has the cycle decomposition of4 1from the previous step.
By the lemma, we know that the cycles must appear in pairs, where one cycle in the pair is the reverse of the other with1applied to each element.
If we knew exactly how the cycles were paired up, we could just read o the values of1.
Unfortunately we *don’t* know how exactly how they pair up, but it will turn out that there aren’t usually too many ways they could pair up.
In the next step we’ll gure out which is the correct one.


Example 2.
5.
*A further complication comes up when*4 1*has more than two cycles of a given* *length.
For instance, if*

4 1= (AILNMC)(RGYBOF)(WZESQU)(DHVXJP)(K)(T)*;*

*then we have to decide how to pair up the cycles of size* 6*, and there are* 3 *dierent ways doing so;* *After pairing them up, we again of* 6 *ways of rotating each pair independently.
*

## 2. 4. 3 Step Three: Identifying1;2, and3

The previous step generates several guesses for the*i*.
To determine which is most likely the correct one, the team would exploit the fact that senders sometimes chose non-random message keys.
Message keys like AAA*;*BBB*;*ABC, etc were chosen by operators, and these characteristics enabled a limited form of frequency analysis.
An easy property is that the rst character of the message key was most frequently A; This yields a guess for1(A), and then the above technique will extend it to guess the rest of cycle containing A.


This process takes some guesswork, but is reported to have worked well.
It helped that a guess could be checked, because even less frequent message keys would often have some structure (like HIJ), and these would appear once the correct permutations had been recovered.


## 2. 4. 4 Proof of Rejewski’s Theorem (Optional)

Let1and2be reectors, and suppose (*a₁ a₂ at*) appears in the cycle decomposition of their product2 1.
We need to show that (1(*at*)1(*at* 1)1(*a₁*)) also appears and is distinct.
Start by writing1(*ai*) = *bi*for *i* = 1*;:::;t*.
Since1is a reector we also have that1(*bi*) = *ai*.
We claim that none of the *bi*will equal any *aj*(more formally, that *fa₁;:::;atg* and *fb₁;:::;btg* are disjoint sets).
We’ll assume that’s true for now and nish proving the theorem, and then come back to verify that fact at the end.


Since2 1(*ai*) = *ai*+1 mod *t*, we must have2(*bi*) = *ai*+1 mod *t*; Again since2is a reector, we have2(*ai*) = *bi* 1 mod *t*for all *i* = 1*;:::;t* (note that we swapped up the subscript to subtract on one side instead of add to the other side, but this still true for general *i*).
Then

2 1(*bi*) =2(*ai*) = *bi* 1 mod *t:*

In other words, we have shown that2 1maps *bi*to *bi* 1 mod *t*, i.
e.
1(*ai*) to1(*ai* 1 mod *t*).
This is exactly what we wanted to show.
We now return to the claim that *fa₁;:::;atg* and *f*1(*a₁*)*;:::;*1(*at*)*g* are disjoint sets.
This will follow from the following lemma.


Lemma 4.
*Suppose*1*and*2*are reectors and that*1(*x*) = *y.
Then x and y are in dierent* *cycles in the decomposition of*2 1*.
