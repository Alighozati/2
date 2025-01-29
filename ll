#include<bits/stdc++.h>
using namespace std;

const int N = 1500 + 20;
int n, k, ps[N], kmp[N][N], ans, _long[N];
string s, t;

int main() {
    cin >> s >> t >> k;
    n = s.size();
    for (int i = 1; i <= n; i++)
        ps[i] = ps[i - 1] + (t[s[i] - 'a'] == '0');
    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j <= n; j++) {
            int k = kmp[i][j];
            while (k > i && s[k] != s[j])
                k = kmp[i][k];
            k += s[k] == s[j];
            kmp[i][j + 1] = k;
        }
    }
    for (int i = 0; i < n; i++)
        for (int j = i + 1; j <= n; j++)
            _long[j] = max(_long[j], kmp[i][j]);
    for (int i = 0; i < n; i++)
        for (int j = i + 1; j <= n; j++)
            if (ps[j] - ps[i] <= k and _long[j] < j - i)
                ans++;
    return cout << ans << "\n", 0;
}
