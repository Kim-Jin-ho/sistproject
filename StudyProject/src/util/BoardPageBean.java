package util;

public class BoardPageBean {

    private int currentPage; // 현재 페이지 번호

    private int pageSize;// 한 페이지에 보여줄 글의 수

    private int totalCount; // 전체 글 수

    private int startRow; // 시작 글

    private int endRow; // 끝 글

    private int allPage; // 페이지 갯수

    private int block; // 한 페이지에 보여줄 페이지 번호 범위

    private int startPage;// 보여줄 페이지의 시작

    private int endPage;// 보여줄 페이지의 끝

    /**
     * @return
     */
    public int getCurrentPage() {
        return currentPage;
    }

    /**
     * @param currentPage - the currentPage to set
     */
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * @return
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * @param pageSize - the pageSize to set
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * @return
     */
    public int getStartRow() {
        return startRow;
    }

    /**
     * @param startRow - the startRow to set
     */
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    /**
     * @return
     */
    public int getEndRow() {
        return endRow;
    }

    /**
     * @param endRow - the endRow to set
     */
    public void setEndRow(int endRow) {
        this.endRow = endRow;
    }

    /**
     * @return
     */
    public int getAllPage() {
        return allPage;
    }

    /**
     * @param allPage - the allPage to set
     */
    public void setAllPage(int allPage) {
        this.allPage = allPage;
    }

    /**
     * @return
     */
    public int getBlock() {
        return block;
    }

    /**
     * @param block - the block to set
     */
    public void setBlock(int block) {
        this.block = block;
    }

    /**
     * @return
     */
    public int getStartPage() {
        return startPage;
    }

    /**
     * @param startPage - the startPage to set
     */
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    /**
     * @return
     */
    public int getEndPage() {
        return endPage;
    }

    /**
     * @param endPage - the endPage to set
     */
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    /**
     * @return
     */
    public int getTotalCount() {
        return totalCount;
    }

    /**
     * @param totalCount - the totalCount to set
     */
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        makePaging();
    }

    private void makePaging() {
        pageSize = 10; // 한 페이지에 보여줄 글의 수

        // 시작 글 번호
        startRow = (currentPage * pageSize) - (pageSize - 1);

        // 끝 글 번호
        endRow = (currentPage * pageSize);

        allPage = (int)Math.ceil(totalCount / (double)pageSize);// 페이지 갯수

        block = 10; // 한 페이지에 보여줄 페이지 번호 범위

        startPage = ((currentPage - 1) / block * block) + 1; // 보여줄 페이지의 시작

        endPage = ((currentPage - 1) / block * block) + block; // 보여줄 페이지의 끝

        // 끝 페이지 번호가 전체 페이지 번호보다 클때
        // 끝 페이지에 전체 페이지 번호를 넣어버리겠다.
        if (endPage > allPage) {
            endPage = allPage;
        }
    }
}
