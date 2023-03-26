; ModuleID = 'src/network/getifaddrs.c'
source_filename = "src/network/getifaddrs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ifaddrs = type { %struct.ifaddrs*, i8*, i32, %struct.sockaddr*, %struct.sockaddr*, %union.anon, i8* }
%struct.sockaddr = type { i16, [14 x i8] }
%union.anon = type { %struct.sockaddr* }
%struct.ifaddrs_ctx = type { %struct.ifaddrs_storage*, %struct.ifaddrs_storage*, [64 x %struct.ifaddrs_storage*] }
%struct.ifaddrs_storage = type { %struct.ifaddrs, %struct.ifaddrs_storage*, %union.sockany, %union.sockany, %union.sockany, i32, [17 x i8] }
%union.sockany = type { %struct.sockaddr_ll_hack }
%struct.sockaddr_ll_hack = type { i16, i16, i32, i16, i8, i8, [24 x i8] }
%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%struct.ifinfomsg = type { i8, i8, i16, i32, i32, i32 }
%struct.ifaddrmsg = type { i8, i8, i8, i8, i32 }
%struct.rtattr = type { i16, i16 }

; Function Attrs: nounwind optsize strictfp
define void @freeifaddrs(%struct.ifaddrs* noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq %struct.ifaddrs* %0, null
  br i1 %2, label %9, label %3

3:                                                ; preds = %1, %3
  %4 = phi %struct.ifaddrs* [ %6, %3 ], [ %0, %1 ]
  %5 = getelementptr inbounds %struct.ifaddrs, %struct.ifaddrs* %4, i64 0, i32 0
  %6 = load %struct.ifaddrs*, %struct.ifaddrs** %5, align 8, !tbaa !3
  %7 = bitcast %struct.ifaddrs* %4 to i8*
  tail call void @free(i8* noundef nonnull %7) #5
  %8 = icmp eq %struct.ifaddrs* %6, null
  br i1 %8, label %9, label %3

9:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @getifaddrs(%struct.ifaddrs** nocapture noundef writeonly %0) local_unnamed_addr #0 {
  %2 = alloca %struct.ifaddrs_ctx, align 8
  %3 = bitcast %struct.ifaddrs_ctx* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 528, i8* nonnull %3) #6
  %4 = call i8* @memset(i8* noundef nonnull %3, i32 noundef 0, i64 noundef 528) #5
  %5 = call i32 @__rtnetlink_enumerate(i32 noundef 0, i32 noundef 0, i32 (i8*, %struct.nlmsghdr*)* noundef nonnull @netlink_msg_to_ifaddr, i8* noundef nonnull %3) #5
  %6 = icmp eq i32 %5, 0
  %7 = getelementptr inbounds %struct.ifaddrs_ctx, %struct.ifaddrs_ctx* %2, i64 0, i32 0
  %8 = load %struct.ifaddrs_storage*, %struct.ifaddrs_storage** %7, align 8, !tbaa !9
  br i1 %6, label %9, label %11

9:                                                ; preds = %1
  %10 = getelementptr inbounds %struct.ifaddrs_storage, %struct.ifaddrs_storage* %8, i64 0, i32 0
  store %struct.ifaddrs* %10, %struct.ifaddrs** %0, align 8, !tbaa !11
  br label %21

11:                                               ; preds = %1
  %12 = icmp eq %struct.ifaddrs_storage* %8, null
  br i1 %12, label %21, label %13

13:                                               ; preds = %11
  %14 = getelementptr inbounds %struct.ifaddrs_storage, %struct.ifaddrs_storage* %8, i64 0, i32 0
  br label %15

15:                                               ; preds = %13, %15
  %16 = phi %struct.ifaddrs* [ %18, %15 ], [ %14, %13 ]
  %17 = getelementptr inbounds %struct.ifaddrs, %struct.ifaddrs* %16, i64 0, i32 0
  %18 = load %struct.ifaddrs*, %struct.ifaddrs** %17, align 8, !tbaa !3
  %19 = bitcast %struct.ifaddrs* %16 to i8*
  call void @free(i8* noundef nonnull %19) #5
  %20 = icmp eq %struct.ifaddrs* %18, null
  br i1 %20, label %21, label %15

21:                                               ; preds = %15, %11, %9
  call void @llvm.lifetime.end.p0i8(i64 528, i8* nonnull %3) #6
  ret i32 %5
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__rtnetlink_enumerate(i32 noundef, i32 noundef, i32 (i8*, %struct.nlmsghdr*)* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal i32 @netlink_msg_to_ifaddr(i8* nocapture noundef %0, %struct.nlmsghdr* noundef %1) #0 {
  %3 = alloca [16 x i8], align 16
  %4 = bitcast %struct.nlmsghdr* %1 to i8*
  %5 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1
  %6 = bitcast %struct.nlmsghdr* %5 to %struct.ifinfomsg*
  %7 = bitcast %struct.nlmsghdr* %5 to %struct.ifaddrmsg*
  %8 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 0, i32 1
  %9 = load i16, i16* %8, align 4, !tbaa !12
  %10 = icmp eq i16 %9, 16
  br i1 %10, label %11, label %43

11:                                               ; preds = %2
  %12 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 2
  %13 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 0, i32 0
  %14 = load i32, i32* %13, align 4, !tbaa !15
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i8, i8* %4, i64 %15
  %17 = ptrtoint i8* %16 to i64
  %18 = and i64 %15, 4294967292
  %19 = icmp eq i64 %18, 32
  br i1 %19, label %63, label %20

20:                                               ; preds = %11
  %21 = bitcast %struct.nlmsghdr* %12 to i8*
  %22 = bitcast %struct.nlmsghdr* %12 to %struct.rtattr*
  br label %23

23:                                               ; preds = %20, %35
  %24 = phi i8* [ %38, %35 ], [ %21, %20 ]
  %25 = phi %struct.rtattr* [ %39, %35 ], [ %22, %20 ]
  %26 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %25, i64 0, i32 1
  %27 = load i16, i16* %26, align 2, !tbaa !16
  %28 = icmp eq i16 %27, 7
  %29 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %25, i64 0, i32 0
  %30 = load i16, i16* %29, align 2, !tbaa !18
  %31 = zext i16 %30 to i64
  br i1 %28, label %32, label %35

32:                                               ; preds = %23
  %33 = zext i16 %30 to i64
  %34 = add nuw nsw i64 %33, 196
  br label %63

35:                                               ; preds = %23
  %36 = add nuw nsw i64 %31, 3
  %37 = and i64 %36, 131068
  %38 = getelementptr inbounds i8, i8* %24, i64 %37
  %39 = bitcast i8* %38 to %struct.rtattr*
  %40 = ptrtoint i8* %38 to i64
  %41 = sub i64 %17, %40
  %42 = icmp ugt i64 %41, 3
  br i1 %42, label %23, label %63

43:                                               ; preds = %2
  %44 = getelementptr inbounds i8, i8* %0, i64 16
  %45 = bitcast i8* %44 to [64 x %struct.ifaddrs_storage*]*
  %46 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 1
  %47 = bitcast i16* %46 to i32*
  %48 = load i32, i32* %47, align 4, !tbaa !19
  %49 = and i32 %48, 63
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds [64 x %struct.ifaddrs_storage*], [64 x %struct.ifaddrs_storage*]* %45, i64 0, i64 %50
  %52 = load %struct.ifaddrs_storage*, %struct.ifaddrs_storage** %51, align 8, !tbaa !11
  %53 = icmp eq %struct.ifaddrs_storage* %52, null
  br i1 %53, label %344, label %54

54:                                               ; preds = %43, %59
  %55 = phi %struct.ifaddrs_storage* [ %61, %59 ], [ %52, %43 ]
  %56 = getelementptr inbounds %struct.ifaddrs_storage, %struct.ifaddrs_storage* %55, i64 0, i32 5
  %57 = load i32, i32* %56, align 4, !tbaa !21
  %58 = icmp eq i32 %57, %48
  br i1 %58, label %63, label %59

59:                                               ; preds = %54
  %60 = getelementptr inbounds %struct.ifaddrs_storage, %struct.ifaddrs_storage* %55, i64 0, i32 1
  %61 = load %struct.ifaddrs_storage*, %struct.ifaddrs_storage** %60, align 8, !tbaa !11
  %62 = icmp eq %struct.ifaddrs_storage* %61, null
  br i1 %62, label %344, label %54

63:                                               ; preds = %54, %35, %11, %32
  %64 = phi %struct.ifaddrs_storage* [ undef, %32 ], [ undef, %11 ], [ undef, %35 ], [ %55, %54 ]
  %65 = phi i64 [ %34, %32 ], [ 200, %11 ], [ 200, %35 ], [ 200, %54 ]
  %66 = tail call i8* @calloc(i64 noundef 1, i64 noundef %65) #5
  %67 = icmp eq i8* %66, null
  br i1 %67, label %344, label %68

68:                                               ; preds = %63
  %69 = load i16, i16* %8, align 4, !tbaa !12
  %70 = icmp eq i16 %69, 16
  br i1 %70, label %71, label %196

71:                                               ; preds = %68
  %72 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 1
  %73 = bitcast i16* %72 to i32*
  %74 = load i32, i32* %73, align 4, !tbaa !23
  %75 = getelementptr inbounds i8, i8* %66, i64 172
  %76 = bitcast i8* %75 to i32*
  store i32 %74, i32* %76, align 4, !tbaa !21
  %77 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 3
  %78 = load i32, i32* %77, align 4, !tbaa !25
  %79 = getelementptr inbounds i8, i8* %66, i64 16
  %80 = bitcast i8* %79 to i32*
  store i32 %78, i32* %80, align 8, !tbaa !26
  %81 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 2
  %82 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 0, i32 0
  %83 = load i32, i32* %82, align 4, !tbaa !15
  %84 = and i32 %83, -4
  %85 = icmp eq i32 %84, 32
  br i1 %85, label %180, label %86

86:                                               ; preds = %71
  %87 = bitcast %struct.nlmsghdr* %81 to %struct.rtattr*
  %88 = bitcast %struct.nlmsghdr* %81 to i8*
  %89 = getelementptr inbounds i8, i8* %66, i64 200
  %90 = getelementptr inbounds i8, i8* %66, i64 48
  %91 = bitcast i8* %90 to i8**
  %92 = getelementptr inbounds i8, i8* %66, i64 136
  %93 = getelementptr inbounds %struct.ifinfomsg, %struct.ifinfomsg* %6, i64 0, i32 2
  %94 = getelementptr inbounds i8, i8* %66, i64 40
  %95 = bitcast i8* %92 to i16*
  %96 = getelementptr inbounds i8, i8* %66, i64 140
  %97 = bitcast i8* %96 to i32*
  %98 = getelementptr inbounds i8, i8* %66, i64 144
  %99 = bitcast i8* %98 to i16*
  %100 = getelementptr inbounds i8, i8* %66, i64 147
  %101 = getelementptr inbounds i8, i8* %66, i64 148
  %102 = bitcast i8* %94 to i8**
  %103 = getelementptr inbounds i8, i8* %66, i64 64
  %104 = getelementptr inbounds i8, i8* %66, i64 24
  %105 = bitcast i8* %103 to i16*
  %106 = getelementptr inbounds i8, i8* %66, i64 68
  %107 = bitcast i8* %106 to i32*
  %108 = getelementptr inbounds i8, i8* %66, i64 72
  %109 = bitcast i8* %108 to i16*
  %110 = getelementptr inbounds i8, i8* %66, i64 75
  %111 = getelementptr inbounds i8, i8* %66, i64 76
  %112 = bitcast i8* %104 to i8**
  %113 = getelementptr inbounds i8, i8* %66, i64 176
  %114 = getelementptr inbounds i8, i8* %66, i64 8
  %115 = bitcast i8* %114 to i8**
  br label %116

116:                                              ; preds = %86, %165
  %117 = phi i8* [ %88, %86 ], [ %171, %165 ]
  %118 = phi %struct.rtattr* [ %87, %86 ], [ %172, %165 ]
  %119 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 0, i32 1
  %120 = load i16, i16* %119, align 2, !tbaa !16
  switch i16 %120, label %165 [
    i16 3, label %121
    i16 1, label %131
    i16 2, label %144
    i16 7, label %157
  ]

121:                                              ; preds = %116
  %122 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 0, i32 0
  %123 = load i16, i16* %122, align 2, !tbaa !18
  %124 = zext i16 %123 to i64
  %125 = add nsw i64 %124, -4
  %126 = icmp ult i64 %125, 17
  br i1 %126, label %127, label %165

127:                                              ; preds = %121
  %128 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 1
  %129 = bitcast %struct.rtattr* %128 to i8*
  %130 = tail call i8* @memcpy(i8* noundef nonnull %113, i8* noundef nonnull %129, i64 noundef %125) #5
  store i8* %113, i8** %115, align 8, !tbaa !27
  br label %165

131:                                              ; preds = %116
  %132 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 0, i32 0
  %133 = load i16, i16* %132, align 2, !tbaa !18
  %134 = zext i16 %133 to i64
  %135 = add nsw i64 %134, -4
  %136 = icmp ugt i64 %135, 24
  br i1 %136, label %165, label %137

137:                                              ; preds = %131
  %138 = load i16, i16* %93, align 2, !tbaa !28
  %139 = load i32, i32* %73, align 4, !tbaa !23
  %140 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 1
  %141 = bitcast %struct.rtattr* %140 to i8*
  store i16 17, i16* %105, align 4, !tbaa !29
  store i32 %139, i32* %107, align 4, !tbaa !29
  store i16 %138, i16* %109, align 4, !tbaa !29
  %142 = trunc i64 %135 to i8
  store i8 %142, i8* %110, align 1, !tbaa !29
  %143 = tail call i8* @memcpy(i8* noundef nonnull %111, i8* noundef nonnull %141, i64 noundef %135) #5
  store i8* %103, i8** %112, align 8, !tbaa !11
  br label %165

144:                                              ; preds = %116
  %145 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 0, i32 0
  %146 = load i16, i16* %145, align 2, !tbaa !18
  %147 = zext i16 %146 to i64
  %148 = add nsw i64 %147, -4
  %149 = icmp ugt i64 %148, 24
  br i1 %149, label %165, label %150

150:                                              ; preds = %144
  %151 = load i16, i16* %93, align 2, !tbaa !28
  %152 = load i32, i32* %73, align 4, !tbaa !23
  %153 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 1
  %154 = bitcast %struct.rtattr* %153 to i8*
  store i16 17, i16* %95, align 4, !tbaa !29
  store i32 %152, i32* %97, align 4, !tbaa !29
  store i16 %151, i16* %99, align 4, !tbaa !29
  %155 = trunc i64 %148 to i8
  store i8 %155, i8* %100, align 1, !tbaa !29
  %156 = tail call i8* @memcpy(i8* noundef nonnull %101, i8* noundef nonnull %154, i64 noundef %148) #5
  store i8* %92, i8** %102, align 8, !tbaa !11
  br label %165

157:                                              ; preds = %116
  store i8* %89, i8** %91, align 8, !tbaa !30
  %158 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 1
  %159 = bitcast %struct.rtattr* %158 to i8*
  %160 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 0, i32 0
  %161 = load i16, i16* %160, align 2, !tbaa !18
  %162 = zext i16 %161 to i64
  %163 = add nsw i64 %162, -4
  %164 = tail call i8* @memcpy(i8* noundef nonnull %89, i8* noundef nonnull %159, i64 noundef %163) #5
  br label %165

165:                                              ; preds = %150, %144, %137, %131, %157, %116, %127, %121
  %166 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %118, i64 0, i32 0
  %167 = load i16, i16* %166, align 2, !tbaa !18
  %168 = zext i16 %167 to i64
  %169 = add nuw nsw i64 %168, 3
  %170 = and i64 %169, 131068
  %171 = getelementptr inbounds i8, i8* %117, i64 %170
  %172 = bitcast i8* %171 to %struct.rtattr*
  %173 = load i32, i32* %82, align 4, !tbaa !15
  %174 = zext i32 %173 to i64
  %175 = getelementptr inbounds i8, i8* %4, i64 %174
  %176 = ptrtoint i8* %175 to i64
  %177 = ptrtoint i8* %171 to i64
  %178 = sub i64 %176, %177
  %179 = icmp ugt i64 %178, 3
  br i1 %179, label %116, label %180

180:                                              ; preds = %165, %71
  %181 = getelementptr inbounds i8, i8* %66, i64 8
  %182 = bitcast i8* %181 to i8**
  %183 = load i8*, i8** %182, align 8, !tbaa !27
  %184 = icmp eq i8* %183, null
  br i1 %184, label %343, label %185

185:                                              ; preds = %180
  %186 = load i32, i32* %76, align 4, !tbaa !21
  %187 = and i32 %186, 63
  %188 = getelementptr inbounds i8, i8* %0, i64 16
  %189 = bitcast i8* %188 to [64 x %struct.ifaddrs_storage*]*
  %190 = zext i32 %187 to i64
  %191 = getelementptr inbounds [64 x %struct.ifaddrs_storage*], [64 x %struct.ifaddrs_storage*]* %189, i64 0, i64 %190
  %192 = load %struct.ifaddrs_storage*, %struct.ifaddrs_storage** %191, align 8, !tbaa !11
  %193 = getelementptr inbounds i8, i8* %66, i64 56
  %194 = bitcast i8* %193 to %struct.ifaddrs_storage**
  store %struct.ifaddrs_storage* %192, %struct.ifaddrs_storage** %194, align 8, !tbaa !31
  %195 = bitcast %struct.ifaddrs_storage** %191 to i8**
  store i8* %66, i8** %195, align 8, !tbaa !11
  br label %324

196:                                              ; preds = %68
  %197 = getelementptr inbounds %struct.ifaddrs_storage, %struct.ifaddrs_storage* %64, i64 0, i32 0, i32 1
  %198 = load i8*, i8** %197, align 8, !tbaa !27
  %199 = getelementptr inbounds i8, i8* %66, i64 8
  %200 = bitcast i8* %199 to i8**
  store i8* %198, i8** %200, align 8, !tbaa !27
  %201 = getelementptr inbounds %struct.ifaddrs_storage, %struct.ifaddrs_storage* %64, i64 0, i32 0, i32 2
  %202 = load i32, i32* %201, align 8, !tbaa !26
  %203 = getelementptr inbounds i8, i8* %66, i64 16
  %204 = bitcast i8* %203 to i32*
  store i32 %202, i32* %204, align 8, !tbaa !26
  %205 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 3
  %206 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 0, i32 0
  %207 = load i32, i32* %206, align 4, !tbaa !15
  %208 = and i32 %207, -4
  %209 = icmp eq i32 %208, 24
  br i1 %209, label %295, label %210

210:                                              ; preds = %196
  %211 = bitcast i32* %205 to %struct.rtattr*
  %212 = bitcast i32* %205 to i8*
  %213 = getelementptr inbounds i8, i8* %66, i64 176
  %214 = getelementptr inbounds i8, i8* %66, i64 24
  %215 = bitcast i8* %214 to %struct.sockaddr**
  %216 = getelementptr inbounds i8, i8* %66, i64 136
  %217 = getelementptr inbounds i8, i8* %66, i64 64
  %218 = getelementptr inbounds i8, i8* %66, i64 40
  %219 = bitcast i8* %218 to i8**
  %220 = bitcast %struct.nlmsghdr* %5 to i8*
  %221 = bitcast i8* %217 to %union.sockany*
  %222 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %1, i64 1, i32 1
  %223 = bitcast i16* %222 to i32*
  %224 = bitcast i8* %218 to %struct.sockaddr**
  %225 = bitcast i8* %216 to %union.sockany*
  br label %226

226:                                              ; preds = %210, %280
  %227 = phi i8* [ %212, %210 ], [ %286, %280 ]
  %228 = phi %struct.rtattr* [ %211, %210 ], [ %287, %280 ]
  %229 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 0, i32 1
  %230 = load i16, i16* %229, align 2, !tbaa !16
  switch i16 %230, label %280 [
    i16 1, label %231
    i16 4, label %245
    i16 2, label %255
    i16 3, label %270
  ]

231:                                              ; preds = %226
  %232 = load %struct.sockaddr*, %struct.sockaddr** %215, align 8, !tbaa !32
  %233 = icmp eq %struct.sockaddr* %232, null
  %234 = load i8, i8* %220, align 4, !tbaa !33
  %235 = zext i8 %234 to i32
  %236 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 1
  %237 = bitcast %struct.rtattr* %236 to i8*
  %238 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 0, i32 0
  %239 = load i16, i16* %238, align 2, !tbaa !18
  %240 = zext i16 %239 to i64
  %241 = add nsw i64 %240, -4
  %242 = load i32, i32* %223, align 4, !tbaa !19
  br i1 %233, label %244, label %243

243:                                              ; preds = %231
  tail call fastcc void @copy_addr(%struct.sockaddr** noundef nonnull %224, i32 noundef %235, %union.sockany* noundef nonnull %225, i8* noundef nonnull %237, i64 noundef %241, i32 noundef %242) #7
  br label %280

244:                                              ; preds = %231
  tail call fastcc void @copy_addr(%struct.sockaddr** noundef nonnull %215, i32 noundef %235, %union.sockany* noundef nonnull %221, i8* noundef nonnull %237, i64 noundef %241, i32 noundef %242) #7
  br label %280

245:                                              ; preds = %226
  %246 = load i8, i8* %220, align 4, !tbaa !33
  %247 = zext i8 %246 to i32
  %248 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 1
  %249 = bitcast %struct.rtattr* %248 to i8*
  %250 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 0, i32 0
  %251 = load i16, i16* %250, align 2, !tbaa !18
  %252 = zext i16 %251 to i64
  %253 = add nsw i64 %252, -4
  %254 = load i32, i32* %223, align 4, !tbaa !19
  tail call fastcc void @copy_addr(%struct.sockaddr** noundef nonnull %224, i32 noundef %247, %union.sockany* noundef nonnull %225, i8* noundef nonnull %249, i64 noundef %253, i32 noundef %254) #7
  br label %280

255:                                              ; preds = %226
  %256 = load %struct.sockaddr*, %struct.sockaddr** %215, align 8, !tbaa !32
  %257 = icmp eq %struct.sockaddr* %256, null
  br i1 %257, label %260, label %258

258:                                              ; preds = %255
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(36) %216, i8* noundef nonnull align 8 dereferenceable(36) %217, i64 36, i1 false) #8, !tbaa.struct !34
  store i8* %216, i8** %219, align 8, !tbaa !29
  %259 = tail call i8* @memset(i8* noundef nonnull %217, i32 noundef 0, i64 noundef 36) #5
  br label %260

260:                                              ; preds = %258, %255
  %261 = load i8, i8* %220, align 4, !tbaa !33
  %262 = zext i8 %261 to i32
  %263 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 1
  %264 = bitcast %struct.rtattr* %263 to i8*
  %265 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 0, i32 0
  %266 = load i16, i16* %265, align 2, !tbaa !18
  %267 = zext i16 %266 to i64
  %268 = add nsw i64 %267, -4
  %269 = load i32, i32* %223, align 4, !tbaa !19
  tail call fastcc void @copy_addr(%struct.sockaddr** noundef nonnull %215, i32 noundef %262, %union.sockany* noundef nonnull %221, i8* noundef nonnull %264, i64 noundef %268, i32 noundef %269) #7
  br label %280

270:                                              ; preds = %226
  %271 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 0, i32 0
  %272 = load i16, i16* %271, align 2, !tbaa !18
  %273 = zext i16 %272 to i64
  %274 = add nsw i64 %273, -4
  %275 = icmp ult i64 %274, 17
  br i1 %275, label %276, label %280

276:                                              ; preds = %270
  %277 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 1
  %278 = bitcast %struct.rtattr* %277 to i8*
  %279 = tail call i8* @memcpy(i8* noundef nonnull %213, i8* noundef nonnull %278, i64 noundef %274) #5
  store i8* %213, i8** %200, align 8, !tbaa !27
  br label %280

280:                                              ; preds = %245, %260, %226, %244, %243, %276, %270
  %281 = getelementptr inbounds %struct.rtattr, %struct.rtattr* %228, i64 0, i32 0
  %282 = load i16, i16* %281, align 2, !tbaa !18
  %283 = zext i16 %282 to i64
  %284 = add nuw nsw i64 %283, 3
  %285 = and i64 %284, 131068
  %286 = getelementptr inbounds i8, i8* %227, i64 %285
  %287 = bitcast i8* %286 to %struct.rtattr*
  %288 = load i32, i32* %206, align 4, !tbaa !15
  %289 = zext i32 %288 to i64
  %290 = getelementptr inbounds i8, i8* %4, i64 %289
  %291 = ptrtoint i8* %290 to i64
  %292 = ptrtoint i8* %286 to i64
  %293 = sub i64 %291, %292
  %294 = icmp ugt i64 %293, 3
  br i1 %294, label %226, label %295

295:                                              ; preds = %280, %196
  %296 = getelementptr inbounds i8, i8* %66, i64 24
  %297 = bitcast i8* %296 to %struct.sockaddr**
  %298 = load %struct.sockaddr*, %struct.sockaddr** %297, align 8, !tbaa !32
  %299 = icmp eq %struct.sockaddr* %298, null
  br i1 %299, label %324, label %300

300:                                              ; preds = %295
  %301 = getelementptr inbounds i8, i8* %66, i64 32
  %302 = bitcast i8* %301 to %struct.sockaddr**
  %303 = bitcast %struct.nlmsghdr* %5 to i8*
  %304 = load i8, i8* %303, align 4, !tbaa !33
  %305 = zext i8 %304 to i32
  %306 = getelementptr inbounds i8, i8* %66, i64 100
  %307 = bitcast i8* %306 to %union.sockany*
  %308 = getelementptr inbounds %struct.ifaddrmsg, %struct.ifaddrmsg* %7, i64 0, i32 1
  %309 = load i8, i8* %308, align 1, !tbaa !37
  %310 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %310) #6
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %310, i8 0, i64 16, i1 false) #6
  %311 = icmp sgt i8 %309, -1
  %312 = select i1 %311, i8 %309, i8 -128
  %313 = zext i8 %312 to i32
  %314 = lshr i32 %313, 3
  %315 = zext i32 %314 to i64
  %316 = call i8* @memset(i8* noundef nonnull %310, i32 noundef 255, i64 noundef %315) #5
  br i1 %311, label %317, label %323

317:                                              ; preds = %300
  %318 = and i32 %313, 7
  %319 = sub nuw nsw i32 8, %318
  %320 = shl nuw nsw i32 255, %319
  %321 = trunc i32 %320 to i8
  %322 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 %315
  store i8 %321, i8* %322, align 1, !tbaa !29
  br label %323

323:                                              ; preds = %300, %317
  call fastcc void @copy_addr(%struct.sockaddr** noundef nonnull %302, i32 noundef %305, %union.sockany* noundef nonnull %307, i8* noundef nonnull %310, i64 noundef 16, i32 noundef 0) #5
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %310) #6
  br label %324

324:                                              ; preds = %295, %323, %185
  %325 = phi i8** [ %182, %185 ], [ %200, %323 ], [ %200, %295 ]
  %326 = load i8*, i8** %325, align 8, !tbaa !27
  %327 = icmp eq i8* %326, null
  br i1 %327, label %343, label %328

328:                                              ; preds = %324
  %329 = bitcast i8* %0 to %struct.ifaddrs_storage**
  %330 = load %struct.ifaddrs_storage*, %struct.ifaddrs_storage** %329, align 8, !tbaa !9
  %331 = icmp eq %struct.ifaddrs_storage* %330, null
  br i1 %331, label %332, label %334

332:                                              ; preds = %328
  %333 = bitcast i8* %0 to i8**
  store i8* %66, i8** %333, align 8, !tbaa !9
  br label %334

334:                                              ; preds = %332, %328
  %335 = getelementptr inbounds i8, i8* %0, i64 8
  %336 = bitcast i8* %335 to %struct.ifaddrs_storage**
  %337 = load %struct.ifaddrs_storage*, %struct.ifaddrs_storage** %336, align 8, !tbaa !38
  %338 = icmp eq %struct.ifaddrs_storage* %337, null
  br i1 %338, label %341, label %339

339:                                              ; preds = %334
  %340 = bitcast %struct.ifaddrs_storage* %337 to i8**
  store i8* %66, i8** %340, align 8, !tbaa !39
  br label %341

341:                                              ; preds = %339, %334
  %342 = bitcast i8* %335 to i8**
  store i8* %66, i8** %342, align 8, !tbaa !38
  br label %344

343:                                              ; preds = %180, %324
  call void @free(i8* noundef nonnull %66) #5
  br label %344

344:                                              ; preds = %59, %43, %341, %343, %63
  %345 = phi i32 [ -1, %63 ], [ 0, %343 ], [ 0, %341 ], [ 0, %43 ], [ 0, %59 ]
  ret i32 %345
}

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc void @copy_addr(%struct.sockaddr** nocapture noundef writeonly %0, i32 noundef %1, %union.sockany* noundef %2, i8* noundef %3, i64 noundef %4, i32 noundef %5) unnamed_addr #0 {
  switch i32 %1, label %36 [
    i32 2, label %7
    i32 10, label %10
  ]

7:                                                ; preds = %6
  %8 = getelementptr inbounds %union.sockany, %union.sockany* %2, i64 0, i32 0, i32 2
  %9 = bitcast i32* %8 to i8*
  br label %27

10:                                               ; preds = %6
  %11 = getelementptr inbounds %union.sockany, %union.sockany* %2, i64 0, i32 0, i32 3
  %12 = bitcast i16* %11 to i8*
  %13 = load i8, i8* %3, align 1, !tbaa !29
  switch i8 %13, label %27 [
    i8 -2, label %14
    i8 -1, label %19
  ]

14:                                               ; preds = %10
  %15 = getelementptr inbounds i8, i8* %3, i64 1
  %16 = load i8, i8* %15, align 1, !tbaa !29
  %17 = and i8 %16, -64
  %18 = icmp eq i8 %17, -128
  br i1 %18, label %24, label %27

19:                                               ; preds = %10
  %20 = getelementptr inbounds i8, i8* %3, i64 1
  %21 = load i8, i8* %20, align 1, !tbaa !29
  %22 = and i8 %21, 15
  %23 = icmp eq i8 %22, 2
  br i1 %23, label %24, label %27

24:                                               ; preds = %19, %14
  %25 = getelementptr inbounds %union.sockany, %union.sockany* %2, i64 0, i32 0, i32 6, i64 12
  %26 = bitcast i8* %25 to i32*
  store i32 %5, i32* %26, align 4, !tbaa !29
  br label %27

27:                                               ; preds = %10, %14, %19, %24, %7
  %28 = phi i8* [ %12, %24 ], [ %12, %19 ], [ %9, %7 ], [ %12, %14 ], [ %12, %10 ]
  %29 = phi i64 [ 16, %24 ], [ 16, %19 ], [ 4, %7 ], [ 16, %14 ], [ 16, %10 ]
  %30 = icmp ugt i64 %29, %4
  br i1 %30, label %36, label %31

31:                                               ; preds = %27
  %32 = trunc i32 %1 to i16
  %33 = getelementptr %union.sockany, %union.sockany* %2, i64 0, i32 0, i32 0
  store i16 %32, i16* %33, align 4, !tbaa !29
  %34 = tail call i8* @memcpy(i8* noundef nonnull %28, i8* noundef %3, i64 noundef %29) #5
  %35 = bitcast %struct.sockaddr** %0 to %union.sockany**
  store %union.sockany* %2, %union.sockany** %35, align 8, !tbaa !11
  br label %36

36:                                               ; preds = %27, %6, %31
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"ifaddrs", !5, i64 0, !5, i64 8, !8, i64 16, !5, i64 24, !5, i64 32, !6, i64 40, !5, i64 48}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!10, !5, i64 0}
!10 = !{!"ifaddrs_ctx", !5, i64 0, !5, i64 8, !6, i64 16}
!11 = !{!5, !5, i64 0}
!12 = !{!13, !14, i64 4}
!13 = !{!"nlmsghdr", !8, i64 0, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 12}
!14 = !{!"short", !6, i64 0}
!15 = !{!13, !8, i64 0}
!16 = !{!17, !14, i64 2}
!17 = !{!"rtattr", !14, i64 0, !14, i64 2}
!18 = !{!17, !14, i64 0}
!19 = !{!20, !8, i64 4}
!20 = !{!"ifaddrmsg", !6, i64 0, !6, i64 1, !6, i64 2, !6, i64 3, !8, i64 4}
!21 = !{!22, !8, i64 172}
!22 = !{!"ifaddrs_storage", !4, i64 0, !5, i64 56, !6, i64 64, !6, i64 100, !6, i64 136, !8, i64 172, !6, i64 176}
!23 = !{!24, !8, i64 4}
!24 = !{!"ifinfomsg", !6, i64 0, !6, i64 1, !14, i64 2, !8, i64 4, !8, i64 8, !8, i64 12}
!25 = !{!24, !8, i64 8}
!26 = !{!22, !8, i64 16}
!27 = !{!22, !5, i64 8}
!28 = !{!24, !14, i64 2}
!29 = !{!6, !6, i64 0}
!30 = !{!22, !5, i64 48}
!31 = !{!22, !5, i64 56}
!32 = !{!22, !5, i64 24}
!33 = !{!20, !6, i64 0}
!34 = !{i64 0, i64 2, !35, i64 2, i64 14, !29, i64 0, i64 2, !35, i64 2, i64 2, !35, i64 4, i64 4, !36, i64 8, i64 2, !35, i64 10, i64 1, !29, i64 11, i64 1, !29, i64 12, i64 24, !29, i64 0, i64 2, !35, i64 2, i64 2, !35, i64 4, i64 4, !36, i64 8, i64 8, !29, i64 0, i64 2, !35, i64 2, i64 2, !35, i64 4, i64 4, !36, i64 8, i64 16, !29, i64 8, i64 16, !29, i64 8, i64 16, !29, i64 24, i64 4, !36}
!35 = !{!14, !14, i64 0}
!36 = !{!8, !8, i64 0}
!37 = !{!20, !6, i64 1}
!38 = !{!10, !5, i64 8}
!39 = !{!22, !5, i64 0}
