function updateFontSize() {
    let min_size=10.0;

    let tag_list=["h1","h2","h3","h4","h5","h6","p"];
    let scale_list=[2.0,1.5,1.25,0.75,0.5,0.25,1.0];

    let set_size=Math.max(parseFloat(window.top.innerWidth)*0.0125,min_size);
    document.getElementsByTagName("html")[0].style.fontSize=""+ set_size +"px";

    for(let cnt=0;cnt<tag_list.length;cnt++) {
        let get_elements=document.getElementsByTagName(tag_list[cnt]);
        for(let cnt2=0;cnt2<get_elements.length;cnt2++) {
            get_elements[cnt2].style.margin="0";
            get_elements[cnt2].style.padding="0";

            get_elements[cnt2].style.lineHeight=""+ (Math.max(set_size*scale_list[cnt],min_size)*2.0) +"px";
            get_elements[cnt2].style.fontSize=""+ (Math.max(set_size*scale_list[cnt],min_size)) +"px";
        }
    }
}

window.addEventListener("load",()=>{
    updateFontSize();
});
window.addEventListener("resize",()=>{
    updateFontSize();
});