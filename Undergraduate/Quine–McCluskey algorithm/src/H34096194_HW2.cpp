#include <iostream>
#include <string>
#include <vector>
#include <set>
#include <map>
#include <fstream>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <cstddef>
#include <array>
#include <set>
#include <sstream>
#include <cstring>
#include <algorithm>
#include <iomanip>
using namespace std;
ifstream in("input.txt");
ofstream out("output.txt");
vector<vector<int> > finalgroup;
vector<string> memory;
vector<char> POSsingleAns;
vector<int> specmin;
vector<int> tmp;
vector<string> input;
struct GroupElement {
    vector<int> minterms;
    vector<int> value;
};
pair<vector<int>, int> getMintermAndCount(const int minTerm, const int literalCount) {
    vector<int> mintermVector;
    int onesCount = 0;
    for (int i = 0; i < literalCount; ++i)
    {
        if (minTerm & 1 << (literalCount - i - 1)) {
            mintermVector.push_back(1);
            onesCount++;
        }
        else
        {
            mintermVector.push_back(0);
        }
    }

    pair<vector<int>, int> mintermAndCount;
    mintermAndCount.first = mintermVector;
    mintermAndCount.second = onesCount;

    return mintermAndCount;
}
// merging function
map<int, vector<GroupElement>> mergeGroupElement(map<int, vector<GroupElement>> numberedGroups, int literals, vector<GroupElement>& notUpdated) {
    // Merged groups will be added here
    map<int, vector<GroupElement>> newNumberedGroups;
    int updateCount = 0;

    set<vector<int>> termsUsed;

    for (auto& group : numberedGroups) {
        if (numberedGroups.count(group.first + 1))
        {
            int wholeGroupNotUpdated = 0;
            for (auto& groupElement : group.second) {
                // Checking if next group is present or not
                // Comparing the elements with the next group elements
                for (auto& nextGroupElement : numberedGroups[group.first + 1]) {
                    int diffIndex = -1;
                    int diffCount = 0;

                    for (int i = 0; i < literals; ++i)
                    {
                        if (groupElement.value[i] != nextGroupElement.value[i]) {
                            diffIndex = i;
                            diffCount++;
                        }
                    }

                    if (diffCount == 1) {
                        updateCount++;
                        wholeGroupNotUpdated++;

                        GroupElement newGroupElement;

                        newGroupElement.value = groupElement.value;
                        newGroupElement.value[diffIndex] = -1;

                        // Adding new minters

                        newGroupElement.minterms = groupElement.minterms;
                        for (auto& m : nextGroupElement.minterms) {
                            newGroupElement.minterms.push_back(m);
                        }

                        termsUsed.insert(groupElement.minterms);
                        termsUsed.insert(nextGroupElement.minterms);

                        // Adding new numbered group
                        newNumberedGroups[group.first].push_back(newGroupElement);
                    }
                }
            }
        }
    }

    if (updateCount == 0) return {};

    for (auto& group : numberedGroups) {
        for (auto& groupElement : group.second) {
            if (!termsUsed.count(groupElement.minterms))
            {
                notUpdated.push_back(groupElement);
            }
        }
    }

    return newNumberedGroups;
}
// second time
bool found1(const int min) {
    for (auto it = begin(specmin); it != end(specmin); ++it) {
        if (*it == 1) {
            ++it;
            if (*it == min) {
                return true;
            }
        }
        else {
            it = it + *it;
        }
    }
    return false;
}
bool found2(const int min, int num) {
    for (auto it = begin(specmin); it != end(specmin); ++it) {
        if (*it == num) {
            ++it;
            for (int i = 0; i < num; i++) {
                if (*it == min) {
                    return true;
                }
                ++it;
            }
            --it;
        }
        else {
            it = it + *it;
        }
    }
    return false;
}
void displayFormatedAnswer(set<vector<int>> answer) {
    // SOP output
    for (auto& i : answer) {
        char letter = 'a';
        for (auto& j : i) {
            if (j != -1) {
                if (j == 1) {
                    POSsingleAns.push_back(letter); // push alphabet
                }
                else {
                    POSsingleAns.push_back(letter); // push alphabet
                    POSsingleAns.push_back((char)(39)); // push " ' " into vector
                }
            }
            letter++;
        }
        POSsingleAns.push_back('+'); // grouped minterms output
    }
    POSsingleAns.pop_back();
}
void printMinterm(const vector<int> v, const set<int> dontCareSet) {
    for (int i = 0; i < v.size(); ++i) {
        out << v[i] << " ";
    }
}
void printState(const vector<int> v, const vector<int> m, const set<int> dontCareSet) {
    for (int i = 0; i < m.size(); ++i) {
        if (dontCareSet.count(m[i])) out << "d";
    }

    out << " ";
    for (int i = 0; i < v.size(); ++i) {
        if (v[i] == -1) {
            out << "-";
        }
        else {
            out << v[i];
        }
    }
}
void printMintermWithDontCare(const vector<int> v, const set<int> dontCareSet) {
    for (int i = 0; i < v.size(); ++i) {
        if (dontCareSet.count(v[i])) out << v[i] /*<< "* "*/;
        else out << v[i];
        if (i != v.size() - 1)
            out << ",";
    }
}
void firstprintgroup(const map<int, vector<GroupElement>> allGroups, const set<int>dontCareSet, bool sel) {
    if (sel) { // select to be answer
        for (auto& group : allGroups) {
            finalgroup.clear(); // clear the memory
            for (auto& groupElement : group.second) {
                vector<int> final; // final answer memory
                for (int i = 0; i < groupElement.minterms.size(); ++i) {
                    final.push_back(groupElement.minterms[i]); let the minterms store in vector
                    sort(final.begin(), final.end()); // sort the answer
                }
                finalgroup.push_back(final); // first time calculation, supply it to second time's
            }
        }
    }
    // erase
    auto last = std::unique(finalgroup.begin(), finalgroup.end());
    finalgroup.erase(last, finalgroup.end());
    // print for debugging
    /*for (int i = 0; i < finalgroup.size(); i++) {
        for (int j = 0; j < finalgroup[i].size(); j++) {
            cout << finalgroup[i][j];
        }
        cout << endl;
    }*/
}
void printGroups1(const map<int, vector<GroupElement>> allGroups, const set<int>dontCareSet) {
    int ctr = 0;
    bool record = false; // record for success output and provide break command
    vector<char> val; // print value store in value and output in the end
    for (auto& group : allGroups) {
        if (ctr) {
            out << "--------------------" << endl;
        }
        for (auto& groupElement : group.second) {
            record = false;
            for (int i = 0; i < groupElement.minterms.size(); ++i) {
                if (dontCareSet.count(groupElement.minterms[i])) // this is don't care bit
                    out << "d";
                else if (!found1(groupElement.minterms[i])) // this is we have to combined terms
                    out << "v";
                else {
                    out << " "; // this is prime implicants
                    memory.push_back(to_string(groupElement.minterms[i])); // push into memory cells
                    record = true; // we get the right answer
                }
            }
            out << " ";
            // binary output
            val.clear(); // clear vector's data
            for (int i = 0; i < groupElement.value.size(); ++i) {
                if (groupElement.value[i] == -1) {
                    val.push_back('-'); // don't care bits for -
                }
                else {
                    val.push_back(groupElement.value[i] + 48); // output its value
                }
            }
            string s(val.begin(), val.end()); // make answer to string, so it can be output
            out << s;
            if (record) { // if it is prime at first group, record its binary value
                memory.push_back(s);
            }
            // debug
            /*for (auto it = begin(memory); it != end(memory); ++it) {
                cout << *it << endl;
            }*/
            out << ": ";
            for (int i = 0; i < groupElement.minterms.size(); ++i) { // output its decimal answer
                if (dontCareSet.count(groupElement.minterms[i]))
                    out << groupElement.minterms[i] /*<< "* "*/; // minterms will have following *
                else
                    out << groupElement.minterms[i];
                if (i != groupElement.minterms.size() - 1) // if has 2 or more output, use comma
                    out << ",";
            }
            out << endl;
            ctr++;
        }
    }
}
void printGroups2(const map<int, vector<GroupElement>> allGroups, const set<int>dontCareSet, int num, int last) {
    int ctr = 0;
    bool record = false;
    vector<char> val;
    vector<string> temp;
    vector<int> output;
    vector<int> lastoutput;
    if (num != last) { // 2 ~ last - 1 group
        for (auto& group : allGroups) {
            if (ctr) {
                out << "--------------------" << endl; // format
            }
            for (auto& groupElement : group.second) {
                // type
                bool exe = false; 
                record = false;
                for (int i = 0; i < groupElement.minterms.size(); ++i) {
                    if (found2(groupElement.minterms[i], num)) {
                        temp.push_back(" "); // this is minterms and stop
                        memory.push_back(to_string(groupElement.minterms[i])); // push minterms in vector
                        record = true; // record minterms
                    }
                    else if (dontCareSet.count(groupElement.minterms[i])) {
                        temp.push_back("d"); // this is don't care bits
                    }
                    else {
                        temp.push_back("v"); // this is we have to choose for combined
                    }
                }
                // recheck
                for (auto it = begin(temp); it != end(temp); ++it) {
                    if (*it == " ") {
                        out << " ";
                        exe = true;
                        break;
                    }
                    else if (*it == "d") {
                        out << "d";
                        exe = true;
                        break;
                    }
                }
                if (!exe) {
                    out << "v";
                }
                out << " ";
                // bin
                val.clear();
                for (int i = 0; i < groupElement.value.size(); ++i) {
                    if (groupElement.value[i] == -1) {
                        val.push_back('-'); // don't care bits for -
                    }
                    else {
                        val.push_back(groupElement.value[i] + 48); // alphabet
                    }
                }
                string s(val.begin(), val.end()); // change answert to string
                out << s;
                if (record) {
                    memory.push_back(s); // push into memory 
                }
                // debug
                /*for (auto it = begin(memory); it != end(memory); ++it) {
                    cout << *it << endl;
                }*/
                out << ": ";
                // dec
                for (int i = 0; i < groupElement.minterms.size(); ++i) {
                    if (dontCareSet.count(groupElement.minterms[i]))
                        out << groupElement.minterms[i] /*<< "* "*/;
                    else
                        out << groupElement.minterms[i];
                    if (i != groupElement.minterms.size() - 1)
                        out << ",";
                }
                out << endl;
                ctr++;
            }
        }
    }
    else {
        for (auto& group : allGroups) {
            if (ctr) {
                out << "--------------------" << endl;
            }
            for (auto& groupElement : group.second) {
                bool exe = false;
                record = false;
                // calculation
                output.clear();
                for (int i = 0; i < groupElement.minterms.size(); ++i) {
                    output.push_back(groupElement.minterms[i]);
                    sort(output.begin(), output.end());
                }
                /*// debug
                for (int i = 0; i < output.size(); ++i) {
                    cout << output[i];
                    if (i + 1 != output.size())
                        cout << ",";
                }
                // debug
                for (int i = 0; i < lastoutput.size(); ++i) {
                    cout << lastoutput[i];
                    if (i + 1 != lastoutput.size())
                        cout << ",";
                }*/
                // type
                temp.clear();
                for (int i = 0; i < groupElement.minterms.size(); ++i) {
                    if (lastoutput == output) {
                        temp.push_back("x");
                    }
                    else {
                        temp.push_back(" ");
                        memory.push_back(to_string(groupElement.minterms[i]));
                        record = true;
                    }
                }
                /*// debug
                for (int i = 0; i < temp.size(); ++i) {
                    cout << temp[i];
                    if (i + 1 != temp.size())
                        cout << ",";
                }*/
                lastoutput.clear();
                lastoutput = output;
                // recheck
                for (auto it = begin(temp); it != end(temp); ++it) {
                    if (*it == "x") {
                        out << "x";
                        exe = true;
                        break;
                    }
                }
                if (!exe) {
                    out << " ";
                }                 
                out << " ";
                // bin
                val.clear();
                for (int i = 0; i < groupElement.value.size(); ++i) {
                    if (groupElement.value[i] == -1) {
                        val.push_back('-');
                    }
                    else {
                        val.push_back(groupElement.value[i] + 48);
                    }
                }
                string s(val.begin(), val.end());
                out << s;
                if (record) {
                    memory.push_back(s);
                }
                // debug
                /*for (auto it = begin(memory); it != end(memory); ++it) {
                    cout << *it << endl;
                }*/
                out << ": ";
                // dec            
                for (int i = 0; i < output.size(); ++i) {
                    out << output[i];
                    if (i + 1 != output.size())
                        out << ",";
                }
                out << endl;
                ctr++;
            }
        }
    }
}
void printNotUpdated(vector<GroupElement> notUpdated, const set<int> dontCareSet) {
    out << endl;
    for (auto& groupElement : notUpdated) {
        printMinterm(groupElement.minterms, dontCareSet);
        out << ": ";
        printState(groupElement.value, groupElement.minterms, dontCareSet);
        out << endl;
    }
    out << endl;
}
int main() {
    char c; // ifstream v, m, d character
    string st; // ifstream input minterms string
    int literalCount; // input variables count
    int minTermsCount; // minterms count
    set<int> minTermsSet; // put all minterms in a set
    int dontCareTermsCount; // don't care bits term count
    set<int> dontCareTermsSet; // put all don't care bits in a set
    // ifstream test data
    while (!in.eof()) {
        in >> c;
        if (c == 'v') {
            in >> literalCount;
        }
        else if (c == 'm') {
            int times = 0;
            in >> st;
            istringstream i(st);
            string s;
            // ignore input comma
            while (getline(i, s, ',')) {
                int m = atoi(s.data());
                for (int ctr = 0; ctr < pow(2, literalCount); ctr++) { // max input terms = power function
                    if (m == ctr) {
                        times++; // minterms counter
                        minTermsSet.insert(ctr);
                        input.push_back(to_string(ctr)); // make input to a vector to make following action
                    }
                }
            }
            minTermsCount = times;
        }
        else if (c == 'd') { // input don't care bits
            int times = 0;  // counter to don't care bits
            in >> st;
            istringstream i(st);
            string s;
            while (getline(i, s, ',')) { // ignore input comma
                int d = atoi(s.data());
                for (int ctr = 0; ctr < pow(2, literalCount); ctr++) {
                    if (d == ctr) {
                        times++; // dont' care bits counter
                        dontCareTermsSet.insert(ctr);
                    }
                }
            }
            dontCareTermsCount = times;
        }
    }
    // Making Groups
    map<int, vector<GroupElement>> numberedGroups;
    // Adding minterms to the numberedGroups
    set<int> totalTerms;
    totalTerms.insert(minTermsSet.begin(), minTermsSet.end());
    totalTerms.insert(dontCareTermsSet.begin(), dontCareTermsSet.end());
    for (auto term : totalTerms) {
        pair<vector<int>, int> result = getMintermAndCount(term, literalCount);
        // Creating a group element
        GroupElement groupEle;
        groupEle.minterms.push_back(term); // take a vector to store minterms' term
        groupEle.value = result.first; // this vector has second index to store its value
        // Adding group element to the respective group
        numberedGroups[result.second].push_back(groupEle);
    }
    // Printing All the Groups (debug)
    /*printGroups(numberedGroups, dontCareTermsSet);*/
    // Merging the Groups & printing them & not updated groups are those which were not considred during merge
    vector<GroupElement> notUpdated;
    int last = 0;
    int i = 2;
    while (true) { // put every groups keep mapping until once group has no member
        map<int, vector<GroupElement>> newNumberedGroups = mergeGroupElement(numberedGroups, literalCount, notUpdated);
        if (newNumberedGroups.size() == 0) { // no member and jump out
            break;
        }
        numberedGroups = newNumberedGroups; // keep renew groups to calculate
        // debug
        /*firstprintgroup(numberedGroups, dontCareTermsSet);*/
        i++;
    }
    i--;
    last = i; // get groups' numbers and pass to second times' calculation
    // printnotupdate
    int s = 1;
    for (auto& groupElement : notUpdated) {
        specmin.push_back(s);
        for (int i = 0; i < groupElement.minterms.size(); ++i) {
            specmin.push_back(groupElement.minterms[i]);
        }
        s++;
    }
    // debug
    /*for (int i = 0; i < specmin.size(); ++i) {
        cout << specmin[i];
    }*/
    // Step to get the minterm and the table of them
    // going through the table and taking the minterms which appear only once in the table
    // and adding it to the answer
    map<int, int> countInTable;
    set<vector<int>> seenMinterms; // Used for identifying the seen minterms
    for (auto& group : numberedGroups) {
        for (auto& groupElement : group.second) {
            // Checking if the minterm is seen or not
            if (seenMinterms.count(groupElement.value)) continue;
            seenMinterms.insert(groupElement.value);
            // Adding minterms to the table
            for (auto& minterm : groupElement.minterms) {
                if (!dontCareTermsSet.count(minterm)) {
                    countInTable[minterm]++;
                }
            }
        }
    }
    // Adding other prime implicants which were lost during merging
    for (auto& groupElement : notUpdated) {
        if (seenMinterms.count(groupElement.value)) continue;
        seenMinterms.insert(groupElement.value);
        // printState(groupElement.value);
        // cout << endl;
        for (auto& minterm : groupElement.minterms) {
            if (!dontCareTermsSet.count(minterm)) {
                countInTable[minterm]++;
            }
        }
    }
    // Now we will extract the answer
    set<vector<int>> answer;
    // it stroes the individual terms used so tha we can check which terms are remaining
    set<int> termsTaken;
    for (auto& cell : countInTable) {
        if (cell.second == 1) {
            for (auto& gp : numberedGroups) {
                for (auto& ele : gp.second) {
                    int count = 0;
                    for (auto& num : ele.minterms) {
                        if (cell.first == num)count++;
                    }
                    if (count != 0) {
                        answer.insert(ele.value);
                        for (auto& num : ele.minterms) {
                            termsTaken.insert(num);
                        }
                    }
                }
            }
        }
    }
    // Finding the elements left in countable which are not included
    // The logic suggest that if the term is in the count table then it is in any of the elements
    for (auto& iterator : countInTable) {
        if (!termsTaken.count(iterator.first)) {
            bool flag = false; // flag represents find correct answer
            // cout << iterator.first << endl; // this is for debugging
            for (auto& gp : numberedGroups) {
                for (auto& ele : gp.second) {
                    for (auto& j : ele.minterms) {
                        if (iterator.first == j) {
                            answer.insert(ele.value); // put set element value into answer set
                            flag = true;
                            break;
                        }
                    }
                    if (flag) break;
                }
                if (flag) break;
            }
            // Checking if it is present
            for (auto& j : notUpdated) {
                for (auto& k : j.minterms) {
                    if (iterator.first == k) { // corresponding to input data, then add into answer
                        answer.insert(j.value);
                        flag = true;
                        break;
                    }
                }
                if (flag) break;
            }
        }
    }
    // This is for the remaining onesfor which is not included
    for (auto& minterm : minTermsSet) {
        if (!countInTable.count(minterm)) {
            answer.insert(getMintermAndCount(minterm, literalCount).first);
        }
    }
    // displayFormatedAnswer(answer);
    // print
    // load data
    in.close();
    in.open("input.txt");
    // ifstream test data
    while (!in.eof()) {
        in >> c;
        if (c == 'v') {
            in >> literalCount;
        }
        else if (c == 'm') {
            int times = 0;
            in >> st;
            istringstream i(st);
            string s;
            while (getline(i, s, ',')) {
                int m = atoi(s.data());
                for (int ctr = 0; ctr < pow(2, literalCount); ctr++) {
                    if (m == ctr) {
                        times++;
                        minTermsSet.insert(ctr);
                    }
                }
            }
            minTermsCount = times;
        }
        else if (c == 'd') {
            int times = 0;
            in >> st;
            istringstream i(st);
            string s;
            while (getline(i, s, ',')) {
                int d = atoi(s.data());
                for (int ctr = 0; ctr < pow(2, literalCount); ctr++) {
                    if (d == ctr) {
                        times++;
                        dontCareTermsSet.insert(ctr);
                    }
                }
            }
            dontCareTermsCount = times;
        }
    }
    // Making Groups
    map<int, vector<GroupElement>> numberedGroup;
    // Adding minterms to the numberedGroups
    set<int> totalTerm;
    // Adding minterms to the numberedGroups
    totalTerm.insert(minTermsSet.begin(), minTermsSet.end());
    totalTerm.insert(dontCareTermsSet.begin(), dontCareTermsSet.end());
    for (auto term : totalTerm) {
        pair<vector<int>, int> result = getMintermAndCount(term, literalCount);
        // Creating a group element
        GroupElement groupEle;
        groupEle.minterms.push_back(term);
        groupEle.value = result.first;
        // Adding group element to the respective group
        numberedGroup[result.second].push_back(groupEle);
        /*
        // Printing the minterm with its value
        cout << term << ": ";
        printMinterm(result.first);
        cout << endl;*/
    }
    out << "====================\n";
    out << "Group 1\n";
    out << "====================\n";
    // Printing All the Groups
    printGroups1(numberedGroup, dontCareTermsSet);

    i = 2;
    while (true) {
        map<int, vector<GroupElement>> newNumberedGroups = mergeGroupElement(numberedGroup, literalCount, notUpdated);
        if (newNumberedGroups.size() == 0) {
            break;
        }
        else {
            out << "\n====================\n";
            out << "Group " << i << ":\n";
            out << "====================\n";
        }
        numberedGroup = newNumberedGroups;
        // find last group
        firstprintgroup(numberedGroups, dontCareTermsSet, i == last);
        // Now Printing the All the Groups
        printGroups2(numberedGroup, dontCareTermsSet, i, last);
        i++;
    }
    out << "\n====================\n";
    out << "Result\n";
    out << "====================\n";
    // form
    out << setw(21) << "|";
    for (const auto& s : minTermsSet) {
        out << setw(4) << s << "|";
    }
    out << endl;
    out << setfill('-') << setw(21) << "+";
    for (int i = 0; i < minTermsCount; i++) {
        out << setfill('-') << setw(5) << "+";
    }
    out << endl;
    displayFormatedAnswer(answer);
    
    vector<char> slice;
    POSsingleAns.push_back('+');
    for (auto it = POSsingleAns.begin(); it != POSsingleAns.end(); ++it) {
        slice.push_back(*it);
        if (*it == '+') {
            slice.pop_back();
            string st(slice.begin(), slice.end());
            // adjustment
            for (int i = 0; i < st.length(); i = i + 2) {
                if (st[i + 1] != (char)(39))
                    st.insert(i + 1, " ");
            }
            slice.clear();
            out << st << setw(21 - st.length()) << setfill(' ') << "|";
            int counter = 0;
            // change to bin
            vector<char> tem;
            tem.clear();
            /*// debug
            cout << st;*/
            for (auto item = begin(st); item != st.end();) {
                if (*item != (char)(counter + 97)) {
                    tem.push_back('-');
                }
                else {
                    if (*(++item) == (char)(39)) {
                        tem.push_back('0');
                    }
                    else {
                        tem.push_back('1');
                    }
                    item++;
                }
                counter++;
            }
            // adjust
            for (int i = tem.size(); i < literalCount; i++) {
                tem.push_back('-');
            }
            string temst(tem.begin(), tem.end());
           /* // debug
            cout << temst;*/
            vector<string> copyinput = input;
            /*// debug
            for (auto it = copyinput.begin(); it != copyinput.end(); it++) {
                cout << *it;
            }*/
            // assign x
            // debug
            /*for (auto it = memory.begin(); it != memory.end(); it++) {
                cout << *it;
            }*/
            /*// debug
            auto index = find(memory.begin(), memory.end(), temst);
            cout << *index;*/
            int bits = 0;
            int n = pow(2, literalCount);
            while (n > 0) {
                n = n / 10;
                ++bits;
            }
            for (auto index = find(memory.begin(), memory.end(), temst); ((string) * (--index)).length() <= bits;) {
                if (index == memory.begin()) {
                    for (auto it = begin(copyinput); it != end(copyinput); ++it) {
                        if (*it == *index) {
                            *it = "x";
                        }
                    }
                    break;
                }
                else {
                    for (auto it = begin(copyinput); it != end(copyinput); ++it) {
                        if (*it == *index) {
                            *it = "x";
                            /*// debug
                            cout << *index;*/
                        }
                    }
                }
            }
            // table
            for (int i = 0; i < minTermsCount; i++) {
                if (copyinput[i] == "x") {
                    out << setw(5) << "x|";
                }
                else {
                    out << setw(5) << "|";
                }
            }
            out << endl;
            copyinput.clear();
        }
    }
    POSsingleAns.pop_back();
    // debug
    /*for (auto it = begin(specmin); it != end(specmin); ++it) {
        cout << *it << endl;
    }*/
    out << setfill('-') << setw(21) << "+";
    for (int i = 0; i < minTermsCount; i++) {
        out << setfill('-') << setw(5) << "+";
    }
    out << endl;
    // showing the answer
    char letter = 'a';
    out << "F(";
    for (int i = 0; i < literalCount; i++) {
        out << letter;
        letter++;
        if (i != literalCount - 1)
            out << ",";
    }
    out << ")=";
    for (auto it = POSsingleAns.begin(); it != POSsingleAns.end(); ++it) {
        out << *it;
    }
    out << endl;
    return 0;
}
