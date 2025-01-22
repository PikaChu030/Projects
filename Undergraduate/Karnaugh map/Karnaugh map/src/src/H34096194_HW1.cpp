#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <cstddef>
#include <array>
#include <set>
#include <sstream>
#include <cstring>
#include <string>
#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;
#define MAX_VAR_N (26)
#define MAX_ITM_N (25600)
#define TERM_NUM(P, G)           (*(int *)((P) + group_len * (G)))
#define TERM_PTR(P, G, T)         (char *)((P) + group_len * (G) + sizeof(int) + term_len * (T))
#define TERM_DATA(P, G, T, K)   (*(char *)((P) + group_len * (G) + sizeof(int) + term_len * (T) + sizeof(int) + sizeof(char) * (K)))
#define TERM_PDATA(P, G, T)       (char *)((P) + group_len * (G) + sizeof(int) + term_len * (T) + sizeof(int))
#define SUB_NUM(P, G, T)         (*(int *)((P) + group_len * (G) + sizeof(int) + term_len * (T)))
#define SUB_DATA(P, G, T, K)     (*(int *)((P) + group_len * (G) + sizeof(int) + term_len * (T) + sizeof(int) + sizeof(char) * (v + 1) + sizeof(int) * (K)))
#define SUB_PDATA(P, G, T)         (int *)((P) + group_len * (G) + sizeof(int) + term_len * (T) + sizeof(int) + sizeof(char) * (v + 1))
int ascii[26] = { 0 };
int term_len = 0;
int group_len = 0;
int* input = NULL;
char* temp = NULL;
char* output = NULL;
int v = 0, m = 0, d = 0;
vector<string> ans;
ifstream in("input.txt");
ofstream out("output.txt");
void load_data() {
    for (int g = 0; g <= v; g++) {
        for (int i = 0; i < m + d; i++) { // load minterm, don't care into array
            int bits = 0;
            int temp = input[i];
            while (temp) {
                if (temp & 0x01)  // logic and, store the value
                    bits++;
                temp >>= 1; // get every bits be checked
            }
            if (bits == g) {
                int temp = input[i];
                int term = TERM_NUM(output, g);
                for (int k = 0; k < v; k++) {
                    TERM_DATA(output, g, term, k) = (temp & (0x01 << (v - 1))) ? '1' : '0';
                    temp <<= 1; // get value and shift left to make v-bits answer 
                }
                TERM_NUM(output, g)++; // candidate prime implicant++
                TERM_DATA(output, g, term, v) = 'm'; // candidate prime implicant data
                SUB_NUM(output, g, term)++; // SUB_NUM++
                SUB_DATA(output, g, term, 0) = input[i]; // put SUB_DATA into compared array
            }
        }
    }
}
void copy_terms() {
    // copy the same value
    for (int g = 0; g <= v; g++) {  // copy groups
        for (int t = 0; t < TERM_NUM(output, g); t++) { // copy TERM_NUM
            if (TERM_DATA(output, g, t, v) == '*') // stop character
                continue;
            memcpy(TERM_PTR(temp, g, TERM_NUM(temp, g)++), TERM_PTR(output, g, t), term_len);
        }
    }
    memcpy(output, temp, group_len * (v + 1)); // copy string STL function
}
int combine_terms() {
    int loop = 0;
    memset(temp, 0x00, group_len * (v + 1)); // make string pointer
    // combine two terms into one term
    for (int g = 0; g < v; g++) {
        for (int t0 = 0; t0 < TERM_NUM(output, g); t0++) { // compare with neighbor
            for (int t1 = 0; t1 < TERM_NUM(output, g + 1); t1++) { // compare with neighbor
                int p = 0, diff = 0;
                for (int k = 0; k < v; k++) { // compare with neighbor
                    if (TERM_DATA(output, g, t0, k) != TERM_DATA(output, g + 1, t1, k))
                        p = k, diff++;
                }
                if (diff == 1) { // if different, keep comparing
                    int term = TERM_NUM(temp, g);
                    for (int i = 0; i < SUB_NUM(output, g, t0); i++) {// compare with neighbor
                        SUB_DATA(temp, g, term, SUB_NUM(temp, g, term)++) = SUB_DATA(output, g, t0, i);
                    }
                    for (int i = 0; i < SUB_NUM(output, g + 1, t1); i++) { // compare with neighbor
                        SUB_DATA(temp, g, term, SUB_NUM(temp, g, term)++) = SUB_DATA(output, g + 1, t1, i);
                    }
                    sort(SUB_PDATA(temp, g, term), SUB_PDATA(temp, g, term) + SUB_NUM(temp, g, term)); // easier to code
                    int* ret = unique(SUB_PDATA(temp, g, term), SUB_PDATA(temp, g, term) + SUB_NUM(temp, g, term));
                    SUB_NUM(temp, g, term) = ret - SUB_PDATA(temp, g, term);
                    memcpy(TERM_PDATA(temp, g, term), TERM_PDATA(output, g, t0), v + 1); // copy string
                    TERM_DATA(temp, g, term, p) = '-'; // label don't care
                    TERM_DATA(temp, g, term, v) = 'm'; // label prime implicant
                    TERM_NUM(temp, g)++; // number of prime implicants++
                    TERM_DATA(output, g, t0, v) = '*'; // not a prime implicant
                    TERM_DATA(output, g + 1, t1, v) = '*'; // not a prime implicant
                    loop = 1;
                }
            }
        }
    }
    copy_terms(); // copy to make comparison
    memset(temp, 0x00, group_len * (v + 1)); // make a pointer
    // remove duplicate terms
    for (int g = 0; g <= v; g++) { // group in
        for (int t0 = 0; t0 < TERM_NUM(output, g) - 1; t0++) { // neighbor
            for (int t1 = t0 + 1; t1 < TERM_NUM(output, g); t1++) { // neighbor
                if (!memcmp(TERM_PDATA(output, g, t0), TERM_PDATA(output, g, t1), v)) {
                    for (int k = 0; k < SUB_NUM(output, g, t1); k++) {
                        SUB_DATA(output, g, t0, SUB_NUM(output, g, t0)++) = SUB_DATA(output, g, t1, k);
                    }
                    sort(SUB_PDATA(output, g, t0), SUB_PDATA(output, g, t0) + SUB_NUM(output, g, t0));
                    int* ret = unique(SUB_PDATA(output, g, t0), SUB_PDATA(output, g, t0) + SUB_NUM(output, g, t0));
                    SUB_NUM(output, g, t0) = ret - SUB_PDATA(output, g, t0); // delete redundant
                    TERM_DATA(output, g, t1, v) = '*'; // not a prime implicant
                }
            }
        }
    }
    copy_terms();
    return loop; // make it true for main while() function
}
int find_prime() {
    int loop = 0;
    int term = 0, group = 0;
    int count = 0, max_count = 0;
    // find the term that contains a single minterm
    for (int i = 0; i < m; i++) {
        count = 0;
        for (int g = 0; g <= v; g++) { // visit every group
            for (int t = 0; t < TERM_NUM(output, g); t++) { // visit every term
                for (int k = 0; k < SUB_NUM(output, g, t); k++) { // visit every block
                    if (input[i] == SUB_DATA(output, g, t, k)) { // compare to origin
                        count++;
                        term = t;
                        group = g;
                    }
                }
            }
        }
        if (count == 1) { // essential prime implicants
            TERM_DATA(output, group, term, v) = 'x'; // change label m -> x 
            for (int k0 = 0; k0 < SUB_NUM(output, group, term); k0++) {
                int found = SUB_DATA(output, group, term, k0); // check neighbor value and itself
                for (int g = 0; g <= v; g++) {// visit every group
                    for (int t = 0; t < TERM_NUM(output, g); t++) { // visit every term
                        for (int k1 = 0; k1 < SUB_NUM(output, g, t); k1++) { // visit every block
                            if (found == SUB_DATA(output, g, t, k1))
                                SUB_DATA(output, g, t, k1) = -1; // -1 for we have already checked
                        }
                    }
                }
            }
            loop = 1;
        }
    }
    // find the term that contains most minterms
    for (int g = 0; g <= v; g++) { // visit every group
        for (int t = 0; t < TERM_NUM(output, g); t++) { // visit every term
            count = 0;
            for (int k = 0; k < SUB_NUM(output, g, t); k++) {// visit every block
                for (int i = 0; i < m; i++) {
                    if (input[i] == SUB_DATA(output, g, t, k)) {
                        count++;
                        if (max_count < count) { // check for substitute
                            max_count = count;
                            term = t;
                            group = g;
                        }
                    }
                }
            }
        }
    }
    if (max_count != 0) {
        TERM_DATA(output, group, term, v) = 'x'; // essential label m -> x
        for (int k0 = 0; k0 < SUB_NUM(output, group, term); k0++) {
            int found = SUB_DATA(output, group, term, k0);
            for (int g = 0; g <= v; g++) { // visit every group
                for (int t = 0; t < TERM_NUM(output, g); t++) { // visit every term
                    for (int k1 = 0; k1 < SUB_NUM(output, g, t); k1++) {// visit every block
                        if (found == SUB_DATA(output, g, t, k1)) // compare to origin
                            SUB_DATA(output, g, t, k1) = -1; // -1 for already checked
                    }
                }
            }
        }
        loop = 1;
    }
    return loop; // return true for main function while loop execution
}
void print_terms() {
    string st;
    int pt[2], counter = 0, times = 0;
    for (int g = 0; g <= v; g++) { // adjust for print ',' , no redundant comma
        times += TERM_NUM(output, g);
    }
    for (int g = 0; g <= v; g++) { // print each groups' TERM_DATA
        if (!TERM_NUM(output, g)) { // if this group has no data, then group++
            continue;
        }
        pt[0] = v;  // index for comma adjusted
        pt[1] = TERM_NUM(output, g); // index for comma adjusted
        for (int t = 0; t < TERM_NUM(output, g); t++) {
            for (int k = 0; k <= v; k++) {
                if (TERM_DATA(output, g, t, k) == '1') // according to alphabet output
                    out << (char)(k + 97);
                else if (TERM_DATA(output, g, t, k) == '0') // 0 for false
                    out << (char)(k + 97) << "'";
            }
            if (times != ++counter) // output one data and give it a comma
                out << ",";
        }
    }
    out << endl;
}
void show_essentialprime() {
    int count = 0;
    for (int g = 0; g <= v; g++) { // v numbers of input are in v groups
        for (int t = 0; t < TERM_NUM(output, g); t++) { // each group has TERM_NUM
            if (TERM_DATA(output, g, t, v) == 'x') { // essential are labeled 'x'
                if (count) 
                    out << ","; // separate different essential prime implicants
                for (int k = 0; k < v; k++) {
                    // no data => no essential prime implicants
                    if (!TERM_DATA(output, g, t, k)) {
                        break;
                    }
                    if (TERM_DATA(output, g, t, k) != '-') { // don't care
                        count++;
                        if (TERM_DATA(output, g, t, k) == '1') // 1 for true
                            out << (char)('a' + k) << "";
                        else
                            out << (char)('a' + k) << "'";     // 0 for false
                    }
                }
            }
        }
    }
    out << endl;
}
void show_output() {
    // ascii code a~z for 0~26
    for (int j = 0; j < 26; j++)
        ascii[j] = j;
    int count = 0;
    for (int g = 0; g <= v; g++) {  // cut into v numbers of groups
        for (int t = 0; t < TERM_NUM(output, g); t++) { // each groups have TERM_NUM
            // essential prime implicants are labeled 'x'
            if (TERM_DATA(output, g, t, v) == 'x') {
                if (!count) {  // print SOP 
                    out << "F(";
                    for (int j = 0; j < v; j++) {
                        out << (char)(ascii[j] + 65);
                        if ((j + 1 != v))
                            out << ",";
                    }
                    out << ")=";
                }
                else 
                    out << "+";
                for (int k = 0; k < v; k++) {
                    // no data => not essential prime implicants for SOP
                    if (!TERM_DATA(output, g, t, k)) 
                        break;
                    if (TERM_DATA(output, g, t, k) != '-') { // don't care bits
                        count++;
                        if (TERM_DATA(output, g, t, k) == '1') // 1 for true
                            out << (char)('a' + k) << "";
                        else
                            out << (char)('a' + k) << "'";     // 0 for false
                    }
                }
            }
        }
    }
    if (!count) { // SOP can be totally eliminated => F = 1
        out << "1";
    }
    out << endl;
}
int main() {
    char c;
    string st;
    // ifstream test data
    while (!in.eof()) {
        in >> c;
        if (c == 'v') {
            in >> v;
            for (int ctr = 0; ctr < pow(2,v); ctr++) {
                ans.push_back("0");
            }
        }
        else if (c == 'm') {
            int times = 0;
            in >> st;
            istringstream i(st);
            string s;
            while (getline(i, s, ',')) {
                int m = atoi(s.data());
                for (int ctr = 0; ctr < pow(2, v); ctr++) {
                    if (m == ctr) {
                        ans[m] = "1";
                        times++;
                    }
                }
            }
            m = times;
        }
        else if (c == 'd') {
            int times = 0;
            while (getline(in, st, ',')) {
                int d = atoi(st.data());
                for (int ctr = 0; ctr < pow(2, v); ctr++) {
                    if (d == ctr) {
                        ans[d] = "x";
                        times++;
                    }
                }
            }
            d = times;
        }
    }
    // put data into defined parameters
    input = (int*)calloc(m + d, sizeof(int));
    term_len = sizeof(int) + sizeof(char) * (v + 1) + sizeof(int) * (m + d) * 2;
    group_len = sizeof(int) + term_len * (m + d) * (m + d);
    temp = (char*)calloc(group_len * (v + 1), sizeof(char));
    output = (char*)calloc(group_len * (v + 1), sizeof(char));
    // print kmap
    if (v == 2) {
        out << "  \\ A|       |\n";
        out << "B  \\ |  0   1|\n";
        out << "-----+---+---+\n";
        out << "  0  | " << ans[0] << " | " << ans[2] << " | \n";
        out << "-----+---+---+\n";
        out << "  1  | " << ans[1] << " | " << ans[3] << " | \n";
        out << "-----+---+---+\n\n";
    }
    else if (v == 3) {
        out << "  \\AB|               |\n";
        out << "C  \\ | 00  01  11  10|\n";
        out << "-----+---+---+---+---+\n";
        out << "  0  | " << ans[0] << " | " << ans[2] << " | " << ans[6] << " | " << ans[4] << " | \n";
        out << "-----+---+---+---+---+\n";
        out << "  1  | " << ans[1] << " | " << ans[3] << " | " << ans[7] << " | " << ans[5] << " | \n";
        out << "-----+---+---+---+---+\n\n";
    }
    else if (v == 4) {
        out << "  \\AB|               |\n";
        out << "CD \\ | 00  01  11  10|\n";
        out << "-----+---+---+---+---+\n";
        out << "  00 | " << ans[0] << " | " << ans[4] << " | " << ans[12] << " | " << ans[8] << " | \n";
        out << "-----+---+---+---+---+\n";
        out << "  01 | " << ans[1] << " | " << ans[5] << " | " << ans[13] << " | " << ans[9] << " | \n";
        out << "-----+---+---+---+---+\n";
        out << "  11 | " << ans[3] << " | " << ans[7] << " | " << ans[15] << " | " << ans[11] << " | \n";
        out << "-----+---+---+---+---+\n";
        out << "  10 | " << ans[2] << " | " << ans[6] << " | " << ans[14] << " | " << ans[10] << " | \n";
        out << "-----+---+---+---+---+\n\n";
    }
    // load data
    for (int i = 0; i < m + d; i++) {
        // 1's position
        for (int j = 0; j < pow(2, v); j++) {
            if (ans[j] == "1") {
                input[i] = j;
                i++;
            }
        }
        // don't care position
        for (int j = 0; j < pow(2, v); j++) {
            if (ans[j] == "x") {
                input[i] = j;
                i++;
            }
        }
    }
    load_data();
    // combine terms
    while (combine_terms());
    // prime implicants
    out << "Prime implicant(s): ";
    while (find_prime());
    print_terms();
    // essential prime implicants
    out << "Essemtial prime implicant(s): ";
    show_essentialprime();
    // find SOP
    show_output();
    // free data
    free(temp);
    free(input);
    free(output);
    // close file
    in.close();
    return 0;
}