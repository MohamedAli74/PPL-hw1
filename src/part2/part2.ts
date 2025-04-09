import * as R from "ramda";
import { rootCertificates } from "tls";

const stringToArray = R.split("");

/* Question 1 */
const vowels: string[] = ['a', 'e', 'i', 'o', 'u'];
export const countVowels: (str: string)=> number = (str) => {
    const strArray: string[] = stringToArray(str.toLowerCase());
    let answer=R.filter(isVowel, strArray).length;
    return answer;
}
const isVowel:(c: string) => boolean = (c)=> {
    return (c === 'a' || c === 'e' || c === 'i' || c === 'o' || c === 'u') ? true : false;
}

/* Question 2 */
export const isPalindrome: (str: string)=>boolean = (str) => {
    const strArray:string[] = stringToArray(str.toLowerCase());
    return check(0,strArray);
}

const check:(i:number,str:string[]) => boolean = (i,str) =>{
    return (i >= str.length / 2)? true : str[i] === str[str.length - 1 - i] && check(i + 1,str);
}
  
/* Question 3 */
export type WordTree = {
    root: string;
    children: WordTree[];
}

export const treeToSentence:(t:WordTree) => string  = (t) =>{
    return t.root + (t.children.length > 0 ?
         " " + R.map(treeToSentence, t.children).join(" ") :
        "");
}
