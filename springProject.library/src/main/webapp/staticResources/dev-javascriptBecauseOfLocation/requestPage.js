const clickHome=function (){
    const  xhr = new XMLHttpRequest();
    xhr.open('GET','./front.html');
    xhr.responseType='document';
    xhr.overrideMimeType('text/html');
    xhr.send();
    xhr.onload=function (){
        const resDoc = xhr.response;
        // body의 section 교체
        const resSection=resDoc.getElementsByTagName('section');
        const docSection=document.getElementsByTagName('section');
        const docBody=document.getElementsByTagName('body');
        for (let i = 0; i < docSection.length; i++) {
            docBody[0].removeChild(docSection[i]);
        }
        const docHeader=document.getElementsByTagName('header');
        for (let i = resSection.length-1; i >= 0; i--) {
            docHeader[0].insertAdjacentElement('afterend',resSection[i]);
        }

        // head link 교체. css 교체
        const docLink=document.getElementsByTagName('link');
        const docHead=document.getElementsByTagName('head');
        for (let i = 0; i < docLink.length; i++) {
            let includeTrue=docLink[i].getAttribute('href').includes('section');
            if (includeTrue) {
                const resLink=resDoc.getElementsByTagName('link');
                for (let j = 0; j < resLink.length; j++) {
                    includeTrue = resLink[j].getAttribute('href').includes('section');
                    if (includeTrue) {
                        docHead[0].replaceChild(resLink[j],docLink[i]);
                        break; //바로 외부 for문 종료하게 문법 변경할 것
                    }
                }
                break;
            }
        }
    }
}

let element = document.getElementsByTagName('button'); //id를 지정해주던가 해서 선택하게 바꿀 것을 고려
element[0].addEventListener('click',clickHome);