package org.com.shop.business.verification;

import java.util.Set;

/**
 * Created by Administrator on 2017/2/3 0003.
 */
public class VerificationCode {

    private String name;

    private Set<Integer> KeySet;

    private String uniqueKey;

    private String tip;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Integer> getKeySet() {
        return KeySet;
    }

    public void setKeySet(Set<Integer> keySet) {
        KeySet = keySet;
    }

    public String getUniqueKey() {
        return uniqueKey;
    }

    public void setUniqueKey(String uniqueKey) {
        this.uniqueKey = uniqueKey;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }
}
