; ModuleID = 'src/locale/locale_map.c'
source_filename = "src/locale/locale_map.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }

@__locale_lock = hidden global [1 x i32] zeroinitializer, align 4
@__locale_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0), align 8
@__get_locale.loc_head = internal global i8* null, align 8
@.str = private unnamed_addr constant [7 x i8] c"LC_ALL\00", align 1
@envvars = internal constant [6 x [12 x i8]] [[12 x i8] c"LC_CTYPE\00\00\00\00", [12 x i8] c"LC_NUMERIC\00\00", [12 x i8] c"LC_TIME\00\00\00\00\00", [12 x i8] c"LC_COLLATE\00\00", [12 x i8] c"LC_MONETARY\00", [12 x i8] c"LC_MESSAGES\00"], align 16
@.str.1 = private unnamed_addr constant [5 x i8] c"LANG\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"C.UTF-8\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"POSIX\00", align 1
@__c_dot_utf8 = external hidden constant %struct.__locale_map, align 8
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@.str.4 = private unnamed_addr constant [13 x i8] c"MUSL_LOCPATH\00", align 1

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__lctrans_impl(i8* noundef %0, %struct.__locale_map* noundef readonly %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.__locale_map* %1, null
  br i1 %3, label %10, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %1, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %1, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !9
  %9 = tail call i8* @__mo_lookup(i8* noundef %6, i64 noundef %8, i8* noundef %0) #3
  br label %10

10:                                               ; preds = %4, %2
  %11 = phi i8* [ %9, %4 ], [ null, %2 ]
  %12 = icmp eq i8* %11, null
  %13 = select i1 %12, i8* %0, i8* %11
  ret i8* %13
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i8* @__mo_lookup(i8* noundef, i64 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden %struct.__locale_map* @__get_locale(i32 noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [256 x i8], align 16
  %4 = alloca i64, align 8
  %5 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %5) #4
  %6 = load i8, i8* %1, align 1, !tbaa !10
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %29

8:                                                ; preds = %2
  %9 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)) #3
  %10 = icmp eq i8* %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %8
  %12 = load i8, i8* %9, align 1, !tbaa !10
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %29

14:                                               ; preds = %11, %8
  %15 = sext i32 %0 to i64
  %16 = getelementptr inbounds [6 x [12 x i8]], [6 x [12 x i8]]* @envvars, i64 0, i64 %15, i64 0
  %17 = tail call i8* @getenv(i8* noundef nonnull %16) #3
  %18 = icmp eq i8* %17, null
  br i1 %18, label %22, label %19

19:                                               ; preds = %14
  %20 = load i8, i8* %17, align 1, !tbaa !10
  %21 = icmp eq i8 %20, 0
  br i1 %21, label %22, label %29

22:                                               ; preds = %19, %14
  %23 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #3
  %24 = icmp eq i8* %23, null
  br i1 %24, label %28, label %25

25:                                               ; preds = %22
  %26 = load i8, i8* %23, align 1, !tbaa !10
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %25, %22
  br label %29

29:                                               ; preds = %11, %19, %25, %28, %2
  %30 = phi i8* [ %1, %2 ], [ %9, %11 ], [ %17, %19 ], [ %23, %25 ], [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), %28 ]
  br label %31

31:                                               ; preds = %29, %35
  %32 = phi i64 [ 0, %29 ], [ %36, %35 ]
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i8, i8* %33, align 1, !tbaa !10
  switch i8 %34, label %35 [
    i8 0, label %38
    i8 47, label %38
  ]

35:                                               ; preds = %31
  %36 = add nuw nsw i64 %32, 1
  %37 = icmp eq i64 %36, 23
  br i1 %37, label %38, label %31

38:                                               ; preds = %31, %31, %35
  %39 = phi i64 [ %32, %31 ], [ %32, %31 ], [ 23, %35 ]
  %40 = load i8, i8* %30, align 1, !tbaa !10
  %41 = icmp eq i8 %40, 46
  br i1 %41, label %48, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds i8, i8* %30, i64 %39
  %44 = load i8, i8* %43, align 1, !tbaa !10
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %42
  %47 = icmp eq i8 %40, 67
  br i1 %47, label %48, label %53

48:                                               ; preds = %42, %38, %46
  %49 = phi i8* [ %30, %46 ], [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), %38 ], [ getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), %42 ]
  %50 = getelementptr inbounds i8, i8* %49, i64 1
  %51 = load i8, i8* %50, align 1, !tbaa !10
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %60, label %53

53:                                               ; preds = %48, %46
  %54 = phi i8* [ %49, %48 ], [ %30, %46 ]
  %55 = tail call i32 @strcmp(i8* noundef nonnull %54, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)) #3
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %60, label %57

57:                                               ; preds = %53
  %58 = tail call i32 @strcmp(i8* noundef nonnull %54, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)) #3
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %68

60:                                               ; preds = %48, %53, %57
  %61 = phi i8* [ %49, %48 ], [ %54, %53 ], [ %54, %57 ]
  %62 = icmp eq i32 %0, 0
  br i1 %62, label %63, label %67

63:                                               ; preds = %60
  %64 = getelementptr inbounds i8, i8* %61, i64 1
  %65 = load i8, i8* %64, align 1, !tbaa !10
  %66 = icmp eq i8 %65, 46
  br i1 %66, label %159, label %67

67:                                               ; preds = %63, %60
  br label %159

68:                                               ; preds = %57
  %69 = load volatile i8*, i8** @__get_locale.loc_head, align 8, !tbaa !11
  %70 = icmp eq i8* %69, null
  br i1 %70, label %82, label %71

71:                                               ; preds = %68
  %72 = bitcast i8* %69 to %struct.__locale_map*
  br label %73

73:                                               ; preds = %71, %78
  %74 = phi %struct.__locale_map* [ %80, %78 ], [ %72, %71 ]
  %75 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %74, i64 0, i32 2, i64 0
  %76 = tail call i32 @strcmp(i8* noundef nonnull %54, i8* noundef nonnull %75) #3
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %159, label %78

78:                                               ; preds = %73
  %79 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %74, i64 0, i32 3
  %80 = load %struct.__locale_map*, %struct.__locale_map** %79, align 8, !tbaa !12
  %81 = icmp eq %struct.__locale_map* %80, null
  br i1 %81, label %82, label %73

82:                                               ; preds = %78, %68
  %83 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !13
  %84 = icmp eq i8 %83, 0
  br i1 %84, label %85, label %137

85:                                               ; preds = %82
  %86 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.4, i64 0, i64 0)) #3
  %87 = icmp eq i8* %86, null
  br i1 %87, label %137, label %88

88:                                               ; preds = %85
  %89 = load i8, i8* %86, align 1, !tbaa !10
  %90 = icmp eq i8 %89, 0
  br i1 %90, label %137, label %91

91:                                               ; preds = %88
  %92 = sub nsw i64 254, %39
  %93 = add nuw i64 %39, 1
  %94 = bitcast i64* %4 to i8*
  br label %95

95:                                               ; preds = %91, %118
  %96 = phi i8* [ %86, %91 ], [ %122, %118 ]
  %97 = call i8* @__strchrnul(i8* noundef nonnull %96, i32 noundef 58) #3
  %98 = ptrtoint i8* %97 to i64
  %99 = ptrtoint i8* %96 to i64
  %100 = sub i64 %98, %99
  %101 = icmp ult i64 %100, %92
  br i1 %101, label %102, label %118

102:                                              ; preds = %95
  %103 = call i8* @memcpy(i8* noundef nonnull %5, i8* noundef nonnull %96, i64 noundef %100) #3
  %104 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 0, i64 %100
  store i8 47, i8* %104, align 1, !tbaa !10
  %105 = getelementptr inbounds i8, i8* %104, i64 1
  %106 = call i8* @memcpy(i8* noundef nonnull %105, i8* noundef nonnull %54, i64 noundef %39) #3
  %107 = add i64 %93, %100
  %108 = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 0, i64 %107
  store i8 0, i8* %108, align 1, !tbaa !10
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %94) #4
  %109 = call i8* @__map_file(i8* noundef nonnull %5, i64* noundef nonnull %4) #3
  %110 = icmp eq i8* %109, null
  br i1 %110, label %117, label %111

111:                                              ; preds = %102
  %112 = call i8* @__libc_malloc(i64 noundef 48) #3
  %113 = icmp eq i8* %112, null
  br i1 %113, label %114, label %125

114:                                              ; preds = %111
  %115 = load i64, i64* %4, align 8, !tbaa !17
  %116 = call i32 @__munmap(i8* noundef nonnull %109, i64 noundef %115) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %94) #4
  br label %137

117:                                              ; preds = %102
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %94) #4
  br label %118

118:                                              ; preds = %117, %95
  %119 = load i8, i8* %97, align 1, !tbaa !10
  %120 = icmp ne i8 %119, 0
  %121 = zext i1 %120 to i64
  %122 = getelementptr inbounds i8, i8* %97, i64 %121
  %123 = load i8, i8* %122, align 1, !tbaa !10
  %124 = icmp eq i8 %123, 0
  br i1 %124, label %137, label %95

125:                                              ; preds = %111
  %126 = bitcast i8* %112 to %struct.__locale_map*
  %127 = bitcast i8* %112 to i8**
  store i8* %109, i8** %127, align 8, !tbaa !3
  %128 = load i64, i64* %4, align 8, !tbaa !17
  %129 = getelementptr inbounds i8, i8* %112, i64 8
  %130 = bitcast i8* %129 to i64*
  store i64 %128, i64* %130, align 8, !tbaa !9
  %131 = getelementptr inbounds i8, i8* %112, i64 16
  %132 = call i8* @memcpy(i8* noundef nonnull %131, i8* noundef nonnull %54, i64 noundef %39) #3
  %133 = getelementptr inbounds i8, i8* %131, i64 %39
  store i8 0, i8* %133, align 1, !tbaa !10
  %134 = load volatile i8*, i8** @__get_locale.loc_head, align 8, !tbaa !11
  %135 = getelementptr inbounds i8, i8* %112, i64 40
  %136 = bitcast i8* %135 to i8**
  store i8* %134, i8** %136, align 8, !tbaa !12
  store volatile i8* %112, i8** @__get_locale.loc_head, align 8, !tbaa !11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %94) #4
  br label %153

137:                                              ; preds = %118, %88, %114, %82, %85
  %138 = call i8* @__libc_malloc(i64 noundef 48) #3
  %139 = icmp eq i8* %138, null
  br i1 %139, label %153, label %140

140:                                              ; preds = %137
  %141 = bitcast i8* %138 to %struct.__locale_map*
  %142 = load i8*, i8** getelementptr inbounds (%struct.__locale_map, %struct.__locale_map* @__c_dot_utf8, i64 0, i32 0), align 8, !tbaa !3
  %143 = bitcast i8* %138 to i8**
  store i8* %142, i8** %143, align 8, !tbaa !3
  %144 = load i64, i64* getelementptr inbounds (%struct.__locale_map, %struct.__locale_map* @__c_dot_utf8, i64 0, i32 1), align 8, !tbaa !9
  %145 = getelementptr inbounds i8, i8* %138, i64 8
  %146 = bitcast i8* %145 to i64*
  store i64 %144, i64* %146, align 8, !tbaa !9
  %147 = getelementptr inbounds i8, i8* %138, i64 16
  %148 = call i8* @memcpy(i8* noundef nonnull %147, i8* noundef nonnull %54, i64 noundef %39) #3
  %149 = getelementptr inbounds i8, i8* %147, i64 %39
  store i8 0, i8* %149, align 1, !tbaa !10
  %150 = load volatile i8*, i8** @__get_locale.loc_head, align 8, !tbaa !11
  %151 = getelementptr inbounds i8, i8* %138, i64 40
  %152 = bitcast i8* %151 to i8**
  store i8* %150, i8** %152, align 8, !tbaa !12
  store volatile i8* %138, i8** @__get_locale.loc_head, align 8, !tbaa !11
  br label %153

153:                                              ; preds = %125, %140, %137
  %154 = phi %struct.__locale_map* [ %126, %125 ], [ %141, %140 ], [ null, %137 ]
  %155 = icmp eq %struct.__locale_map* %154, null
  %156 = icmp eq i32 %0, 0
  %157 = and i1 %156, %155
  %158 = select i1 %157, %struct.__locale_map* @__c_dot_utf8, %struct.__locale_map* %154
  br label %159

159:                                              ; preds = %73, %63, %153, %67
  %160 = phi %struct.__locale_map* [ null, %67 ], [ %158, %153 ], [ @__c_dot_utf8, %63 ], [ %74, %73 ]
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %5) #4
  ret %struct.__locale_map* %160
}

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__map_file(i8* noundef, i64* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__munmap(i8* noundef, i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"__locale_map", !5, i64 0, !8, i64 8, !6, i64 16, !5, i64 40}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!4, !8, i64 8}
!10 = !{!6, !6, i64 0}
!11 = !{!5, !5, i64 0}
!12 = !{!4, !5, i64 40}
!13 = !{!14, !6, i64 2}
!14 = !{!"__libc", !6, i64 0, !6, i64 1, !6, i64 2, !6, i64 3, !15, i64 4, !5, i64 8, !5, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !16, i64 56}
!15 = !{!"int", !6, i64 0}
!16 = !{!"__locale_struct", !6, i64 0}
!17 = !{!8, !8, i64 0}
