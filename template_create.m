%TEMPLATES FOR OCR FONTS
A = imread('ocrfonts_images\a1.bmp');
B = imread('ocrfonts_images\b1.bmp');
C = imread('ocrfonts_images\c1.bmp');
D = imread('ocrfonts_images\d1.bmp');
E = imread('ocrfonts_images\e1.bmp');
F = imread('ocrfonts_images\f1.bmp');
G = imread('ocrfonts_images\g1.bmp');
H = imread('ocrfonts_images\h1.bmp');
I = imread('ocrfonts_images\i1.bmp');
J = imread('ocrfonts_images\j1.bmp');
K = imread('ocrfonts_images\k1.bmp');
L = imread('ocrfonts_images\l1.bmp');
M = imread('ocrfonts_images\m1.bmp');
N = imread('ocrfonts_images\n1.bmp');
O = imread('ocrfonts_images\o1.bmp');
P = imread('ocrfonts_images\p1.bmp');
Q = imread('ocrfonts_images\q1.bmp');
R = imread('ocrfonts_images\r1.bmp');
S = imread('ocrfonts_images\s1.bmp');
T = imread('ocrfonts_images\t1.bmp');
U = imread('ocrfonts_images\u1.bmp');
V = imread('ocrfonts_images\v1.bmp');
W = imread('ocrfonts_images\w1.bmp');
X = imread('ocrfonts_images\x1.bmp');
Y = imread('ocrfonts_images\y1.bmp');
Z = imread('ocrfonts_images\z1.bmp');
a = imread('ocrfonts_images\a2.bmp');
b = imread('ocrfonts_images\b2.bmp');
c = imread('ocrfonts_images\c2.bmp');
d = imread('ocrfonts_images\d2.bmp');
e = imread('ocrfonts_images\e2.bmp');
f = imread('ocrfonts_images\f2.bmp');
g = imread('ocrfonts_images\g2.bmp');
h = imread('ocrfonts_images\h2.bmp');
i = imread('ocrfonts_images\i2.bmp');
j = imread('ocrfonts_images\j2.bmp');
k = imread('ocrfonts_images\k2.bmp');
l = imread('ocrfonts_images\l2.bmp');
m = imread('ocrfonts_images\m2.bmp');
n = imread('ocrfonts_images\n2.bmp');
o = imread('ocrfonts_images\o2.bmp');
p = imread('ocrfonts_images\p2.bmp');
q = imread('ocrfonts_images\q2.bmp');
r = imread('ocrfonts_images\r2.bmp');
s = imread('ocrfonts_images\s2.bmp');
t = imread('ocrfonts_images\t2.bmp');
u = imread('ocrfonts_images\u2.bmp');
v = imread('ocrfonts_images\v2.bmp');
w = imread('ocrfonts_images\w2.bmp');
x = imread('ocrfonts_images\x2.bmp');
y = imread('ocrfonts_images\y2.bmp');
z = imread('ocrfonts_images\z2.bmp');
one = imread('ocrfonts_images\1.bmp');
two = imread('ocrfonts_images\2.bmp');
three = imread('ocrfonts_images\3.bmp');
four = imread('ocrfonts_images\4.bmp');
five = imread('ocrfonts_images\5.bmp');
six = imread('ocrfonts_images\6.bmp');
seven = imread('ocrfonts_images\7.bmp');
eight = imread('ocrfonts_images\8.bmp');
nine = imread('ocrfonts_images\9.bmp');
zero = imread('ocrfonts_images\0.bmp');

letter = [A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z];
number = [one two three four five six seven eight nine zero];
character = [letter number];
templates = mat2cell(character,34,[19 19 19 19 19 19 19 19 19 19 ...
    19 19 19 19 19 19 19 19 19 19 ...
    19 19 19 19 19 19 19 19 19 19 ...
    19 19 19 19 19 19 19 19 19 19 ...
    19 19 19 19 19 19 19 19 19 19 ...
    19 19 19 19 19 19 19 19 19 19 ...
    19 19]);
save ('templates','templates')
clear all